function tprint (tbl, indent)
   if not indent then indent = 0 end
   local toprint = string.rep(' ', indent) .. '{\n'
   indent = indent + 2 
   for k, v in pairs(tbl) do
      toprint = toprint .. string.rep(' ', indent)
      if (type(k) == 'number') then
         toprint = toprint .. '[' .. k .. '] = '
      elseif (type(k) == 'string') then
         toprint = toprint  .. k ..  '= '   
      end
      if (type(v) == 'number') then
         toprint = toprint .. v .. ',\n'
      elseif (type(v) == 'string') then
         toprint = toprint .. '\"' .. v .. '\",\n'
      elseif (type(v) == 'table') then
         toprint = toprint .. tprint(v, indent + 2) .. ',\n'
      else
         toprint = toprint .. '\"' .. tostring(v) .. '\",\n'
      end
   end
   toprint = toprint .. string.rep(' ', indent-2) .. '}'
   return toprint
end


local function has_value (tab, val)
   for index, value in ipairs(tab) do
      if value == val then
         return true, index
      end
   end
   return false
end

function Div(element)
   if element.classes and #element.classes > 0 then 
      if has_value(element.classes, 'for-format') then
         if not has_value(element.classes, FORMAT) then 
            io.write('Something is missing here in format \"', FORMAT, '\".\n')
            -- io.write(tprint(element), '\n')
            return {}
            -- return {
            --    pandoc.Para(
            --       pandoc.List({
            --             pandoc.Str (
            --                'Something is missing here in format \"' ..
            --                FORMAT .. '\".')}))}
         else
            io.write('Has something here in format \"', FORMAT, '\".\n')
         end
      elseif has_value(element.classes, 'box') then
         if FORMAT == 'ms' then 
            return {pandoc.RawBlock('ms', '.sp 0.2v\n.B1'), element,
                    pandoc.RawBlock('ms', '.sp 0.2v\n.B2\n.sp 0.2v') }
         elseif FORMAT == 'context' then
            return {pandoc.RawBlock('context', '\\startframedtext[width=broad,rulethickness=0.75pt,offset=7pt,aligned=yes]'),
                    element,
                    pandoc.RawBlock('context', '\\stopframedtext{}') }

         elseif FORMAT == 'html' then
            -- TODO: do something with class box?
            return {pandoc.RawBlock('html', '<div style=\"border:solid\">'),
                    element, pandoc.RawBlock('html', '</div>') }
         end
      elseif has_value(element.classes, 'keep') then
         if FORMAT == 'ms' then 
            return {pandoc.RawBlock('ms', '.KS\n'), element,
                    pandoc.RawBlock('ms', '.KE\n') }
            -- Should really figure out how to do this in context.
         end
      end
   end
   return element
end -- Div

function Table(element)
   if FORMAT == 'ms' then
      return {pandoc.RawBlock('ms', '.na\n'), element,
              pandoc.RawBlock('ms', '.ad\n') }
   end
end -- Table
      

color_seen = false

function Span(el)
   -- EPUB does it through CSS; HTML probably should too.
   if el.classes and #el.classes > 0 then
      if has_value(el.classes, 'title-ref') then
         if FORMAT == 'ms' then 
            table.insert(el.content, 1, pandoc.RawInline('ms', '\\fI'))
            table.insert(el.content, pandoc.RawInline('ms', '\\fP'))
         elseif FORMAT == 'context' then
            table.insert(el.content, 1, pandoc.RawInline('context', '{\\it '))
            table.insert(el.content, pandoc.RawInline('context', '}'))
         elseif FORMAT == 'latex' then
            table.insert(el.content, 1, pandoc.RawInline('latex', '\\textit{'))
            table.insert(el.content, pandoc.RawInline('latex', '}'))
         elseif FORMAT == 'html' then -- use CSS instead?
            table.insert(el.content, 1, pandoc.RawInline('html', '<cite>'))
            table.insert(el.content, pandoc.RawInline('html', '</cite>'))
         -- elseif FORMAT == 'odt' then
         --    has, i = has_value(el.classes, 'title-ref')
         --    io.write ('Found a title-ref in \"' .. FORMAT .. '\" format.\n')
         --    io.write('title-ref: ' .. el.classes[i] .. '\n')
         --    -- io.write('old span:\n')
         --    -- io.write(tprint (el, 2))
         --    -- el.classes[i] = {"custom-sytle", el.classes[i]}
         --    -- io.write('new span:\n')
         --    -- io.write(tprint (el, 2))
         --    -- io.write('\n')
         elseif FORMAT == 'epub' then -- do nothing, epub does it with css.
         else
            io.write('Format \"', FORMAT, '\" title-ref unimplemented.\n')
         end
      elseif has_value(el.classes, 'skill') or has_value(el.classes, 'att')
         or has_value(el.classes, 'spell') or has_value(el.classes, 'power')
         or has_value(el.classes, 'edge')
      then
         if FORMAT == 'ms' then 
            table.insert(el.content, 1, pandoc.RawInline('ms', '\\S\'15\''))
            table.insert(el.content, pandoc.RawInline('ms', '\\S\'0\''))
         elseif FORMAT == 'context' then
            table.insert(el.content, 1, pandoc.RawInline('context', '{\\it '))
            table.insert(el.content, pandoc.RawInline('context', '}'))
         elseif FORMAT == 'latex' then
            table.insert(el.content, 1, pandoc.RawInline('latex', '\\textit{'))
            table.insert(el.content, pandoc.RawInline('latex', '}'))
         elseif FORMAT == 'html' then
            table.insert(el.content, 1, pandoc.RawInline('html', '<i>'))
            table.insert(el.content, pandoc.RawInline('html', '</i>'))
         else
            io.write('Format \"', FORMAT,
                     '\" skill, att, spell, power, edge unimplemented.\n')
         end
      elseif has_value(el.classes, 'name') or has_value(el.classes, 'place')
         or has_value(el.classes, 'money') or has_value(el.classes, 'room')
         or has_value(el.classes, 'item')
      then
         if FORMAT == 'ms' then 
            table.insert(el.content, 1, pandoc.RawInline('ms', '\\fB'))
            table.insert(el.content, pandoc.RawInline('ms', '\\fP'))
         elseif FORMAT == 'context' then
            table.insert(el.content, 1, pandoc.RawInline('context', '{\\bf '))
            table.insert(el.content, pandoc.RawInline('context', '}'))
         elseif FORMAT == 'latex' then
            table.insert(el.content, 1, pandoc.RawInline('latex', '\\textbf{'))
            table.insert(el.content, pandoc.RawInline('latex', '}'))
         elseif FORMAT == 'html' then
            table.insert(el.content, 1, pandoc.RawInline('html', '<b>'))
            table.insert(el.content, pandoc.RawInline('html', '</b>'))
         else
            io.write('Format \"', FORMAT,
                     '\" name, money, room unimplemented.\n')
         end
      elseif has_value(el.classes, 'bi') then
         if FORMAT == 'ms' then
            table.insert(el.content, 1, pandoc.RawInline('ms', '\\f[BI]'))
            table.insert(el.content, pandoc.RawInline('ms', '\\fP'))
         elseif FORMAT == 'context' then
            table.insert(el.content, 1, pandoc.RawInline('context', '{\\bi '))
            table.insert(el.content, pandoc.RawInline('context', '}'))
         elseif FORMAT == 'latex' then
            table.insert(el.content, 1, pandoc.RawInline('latex',
                                                         '\\textbf{\\emph{'))
            table.insert(el.content, pandoc.RawInline('latex', '}}'))
         elseif FORMAT == 'html' then
            table.insert(el.content, 1, pandoc.RawInline('html', '<b><i>'))
            table.insert(el.content, pandoc.RawInline('html', '</i></b>'))
         else
            io.write('Format \"', FORMAT, '\" bi unimplemented.\n')
         end
      elseif has_value(el.classes, 'red') then
         if FORMAT == 'ms' then
            if not color_seen then
               color_seen = true
               io.write ('Format \"', FORMAT,
                         '\" requires .color in a template.\n')
            end
            table.insert (el.content, 1, pandoc.RawInline ('ms', '\\m[red]'))
            table.insert (el.content, pandoc.RawInline ('ms', '\\m[]'))
         elseif FORMAT == 'context' then
            table.insert (el.content, 1,
                          pandoc.RawInline ('context', '\\color[red]{'))
            table.insert (el.content, pandoc.RawInline ('context', '}'))
         elseif FORMAT == 'html' then
            table.insert (el.content, 1,
                          pandoc.RawInline ('html', '<span style="color:Red;">'))
            table.insert (el.content, pandoc.RawInline ('html', '</span>'))
         elseif FORMAT == 'epub' then
            io.write ('Remember to use a CSS file with "span.red" defined.\n')
         elseif FORMAT == 'latex' then
            table.insert (el.content, 1,
                          pandoc.RawInline ('latex', '\\textcolor{red}{'))
            table.insert (el.content, pandoc.RawInline ('latex', '}'))
         else
            io.write ('Format \"', FORMAT, '\" red unimplemented.\n')
         end
      elseif has_value(el.classes, 'green') then
         if FORMAT == 'ms' then
            if not color_seen then
               color_seen = true
               io.write ('Format \"', FORMAT,
                         '\" requires .color in a template.\n')
            end
            table.insert (el.content, 1, pandoc.RawInline ('ms', '\\m[green]'))
            table.insert (el.content, pandoc.RawInline ('ms', '\\m[]'))
         elseif FORMAT == 'context' then
            table.insert (el.content, 1,
                          pandoc.RawInline ('context', '\\color[green]{'))
            table.insert (el.content, pandoc.RawInline ('context', '}'))
         elseif FORMAT == 'html' then
            table.insert (el.content, 1,
                          pandoc.RawInline ('html', '<span style="color:Green;">'))
            table.insert (el.content, pandoc.RawInline ('html', '</span>'))
         elseif FORMAT == 'epub' then
            io.write ('Remember to use a CSS file with "span.green" defined.\n')
         elseif FORMAT == 'latex' then
            table.insert (el.content, 1,
                          pandoc.RawInline ('latex', '\\textcolor{green}{'))
            table.insert (el.content, pandoc.RawInline ('latex', '}'))
         else
            io.write ('Format \"', FORMAT, '\" green unimplemented.\n')
         end
      end
      elseif has_value(el.classes, 'blue') then
         if FORMAT == 'ms' then
            if not color_seen then
               color_seen = true
               io.write ('Format \"', FORMAT,
                         '\" requires .color in a template.\n')
            end
            table.insert (el.content, 1, pandoc.RawInline ('ms', '\\m[blue]'))
            table.insert (el.content, pandoc.RawInline ('ms', '\\m[]'))
         elseif FORMAT == 'context' then
            table.insert (el.content, 1,
                          pandoc.RawInline ('context', '\\color[blue]{'))
            table.insert (el.content, pandoc.RawInline ('context', '}'))
         elseif FORMAT == 'html' then
            table.insert (el.content, 1,
                          pandoc.RawInline ('html', '<span style="color:Blue;">'))
            table.insert (el.content, pandoc.RawInline ('html', '</span>'))
         elseif FORMAT == 'epub' then
            io.write ('Remember to use a CSS file with "span.blue" defined.\n')
         elseif FORMAT == 'latex' then
            table.insert (el.content, 1,
                          pandoc.RawInline ('latex', '\\textcolor{blue}{'))
            table.insert (el.content, pandoc.RawInline ('latex', '}'))
         else
            io.write ('Format \"', FORMAT, '\" blue unimplemented.\n')
         end
   end
   return el
end -- Span
