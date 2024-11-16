-- @protect      <nowiki>
-- @module       LinkTemplate
-- @description  Module for creating link templates.
-- @version      1.4
-- @usage        require('Dev:LinkTemplate')
-- @author       TheGoldenPatrik1
-- @release      Stable

local p = {}
local i18n = require('Dev:I18n').loadMessages('LinkTemplate')
local userError = require('Dev:User error')

-- @method       p.full
-- @description  Creates an fullurl link with URL parameters
-- @param        {String} link - The page to link to
-- @param        {String} params - The URL parameters
-- @param        {String} text - The link text
function p.full(link, params, text)
    return '<span class="plainlinks">[' .. tostring(mw.uri.canonicalUrl(link, params)) .. ' ' .. (text or link) .. ']</span>'
end

-- @method       p.link
-- @description  Creates an internal link
-- @param        {String} link - The page to link to
-- @param        {String} text - The link text
function p.link(link, text)
    return '[[:' .. link .. '|' .. (text or link) .. ']]'
end

-- @method       p.plain
-- @description  Creates an external plainlink
-- @param        {String} link - The URL to link to
-- @param        {String} text - The link text
function p.plain(link, text)
    return '<span class="plainlinks">[' .. link .. ' ' .. text .. ']</span>'
end

-- @method       p.external
-- @description  Creates plainlinks to other websites
-- @param        {String} defaultLink - The default link
-- @param        {String} defaultText - The default text
-- @param        {String} paramA - The first arg
-- @param        {String} paramB - The second arg
function p.external(defaultLink, defaultText, paramA, paramB)
    if defaultLink then
        return p.plain(defaultLink, paramA or defaultText or defaultLink)
    elseif paramA then
        return p.plain(paramA, paramB or defaultText or paramA)
    end
end

-- @method       p.interwiki
-- @description  Generates interwiki links
-- @param        {String} prefix - The link prefix
-- @param        {String} suffix - The link suffix
-- @param        {String} wiki - The wiki to link to
-- @param        {String} wikiName - The wiki's name
-- @param        {String} paramA - The first arg
-- @param        {String} paramB - The second arg
-- @param        {String} url - The url arg
function p.interwiki(prefix, suffix, wiki, wikiName, paramA, paramB, url)
    if url then
        local uri = url:gsub('-', '=')
        if not paramA then
            return p.full(prefix .. wiki .. suffix, uri, paramB or wikiName)
        elseif paramB == 'f' or paramB == 'F' then
            return p.full(prefix .. wiki .. ':' .. paramA, uri, prefix .. wiki .. ':' .. paramA)
        else
            return p.full(prefix .. wiki .. ':' .. paramA, uri, paramB or paramA)
        end
    elseif not paramA then
        return p.link(prefix .. wiki .. suffix, paramB or wikiName)
    elseif paramB == 'f' or paramB == 'F' then
        return p.link(prefix .. wiki .. ':' .. paramA, prefix .. wiki .. ':' .. paramA)
    else
        return p.link(prefix .. wiki .. ':' .. paramA, paramB or paramA)
    end
end

-- @method       p.namespace
-- @description  Generates namespace links
-- @param        {String} namespace - The namespace to link to
-- @param        {String} paramA - The first arg
-- @param        {String} paramB - The second arg
-- @param        {String} url - The url arg
function p.namespace(namespace, paramA, paramB, url)
    local ns = mw.site.namespaces[tonumber(namespace)].name
    local title = i18n:useContentLang():msg('ns', ns .. ':')
    local special = i18n:useContentLang():msg('special', ns)
    if url then
        local uri = url:gsub('-', '=')
        if not paramA then
            if namespace == '-1' then
                return p.full('Special:SpecialPages', uri, paramB or '<span title=\"' .. special .. '\">' .. ns .. '</span>')
            else
                return p.full('Special:PrefixIndex/' .. ns .. ':', uri, paramB or '<span title=\"' .. title .. '\">' .. ns .. '</span>')
            end
        elseif paramB == 'f' or paramB == 'F' then
            return p.full(ns .. ':' .. paramA, uri)
        else
            return p.full(ns .. ':' .. paramA, uri, paramB or paramA)
        end
    elseif not paramA then
        if namespace == '-1' then
            return p.link('Special:SpecialPages', paramB or '<span title=\"' .. special .. '\">' .. ns .. '</span>')
        else
            return p.link('Special:PrefixIndex/' .. ns .. ':', paramB or '<span title=\"' .. title .. '\">' .. ns .. '</span>')
        end
    elseif paramB == 'f' or paramB == 'F' then
        return p.link(ns .. ':' .. paramA)
    else
        return p.link(ns .. ':' .. paramA, paramB or paramA)
    end
end

-- @method       p.page
-- @description  Generates links to pages
-- @param        {String} page - The page to link to
-- @param        {String} defaultText - The template's default text
-- @param        {String} paramA - The first arg
-- @param        {String} url - The url arg
function p.page(page, defaultText, paramA, url)
    if url then
        return p.full(page, url:gsub('-', '='), paramA or defaultText or page)
    else
        return p.link(page, paramA or defaultText or page)
    end
end

-- @method       p.main
-- @description  The main function; determines what to do
-- @param        {String} frame - User input
function p.main(frame)
    local linkType = frame.args[1]
    local data = frame.args[2]
    local defaultText = frame.args[3]
    local pargs = frame:getParent().args
    local paramA = pargs[1]
    local paramB = pargs[2]
    local url = pargs['url']
    local cat = 'Pages with user errors'
    if linkType == 'ns' then
        if data then
            return p.namespace(data, paramA, paramB, url)
        else
            return userError('no namespace specified', cat)
        end
    elseif linkType == 'wiki' then
        if data and defaultText then
            return p.interwiki('w:c:', '', data, defaultText, paramA, paramB, url)
        else
            return userError('no wiki specified', cat)
        end
    elseif linkType == 'mediawiki' then
        if data and defaultText then
            return p.interwiki('', ':', data, defaultText, paramA, paramB, url)
        else
            return userError('no data specified', cat)
        end
    elseif linkType == 'page' then
        if data then
            return p.page(data, defaultText, paramA, url)
        else
            return userError('no page specified', cat)
        end
    elseif linkType == 'external' then
        return p.external(data, defaultText, paramA, paramB)
    else
        return userError('invalid link type', cat)
    end
end

return p
