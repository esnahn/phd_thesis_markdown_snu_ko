function Inlines(ils)
    i = 1
    while ils[i] do
      if ils[i].t == "RawInline" and ils[i].format == "latex" and ils[i].text == "\\caption" then
        if ils[i+1] and ils[i+1].t == "Span" then
          ils[i].text = ils[i].text .. "["
          ils:insert(i+1, pandoc.RawInline("latex", "]"))
          ils:insert(i+1, pandoc.walk_inline(ils[i+2], {
            Inline = function(elem)
              if elem.t == "Note" then
                return pandoc.Str("")
              else
                return elem
              end
            end
          }))
        end
      end
      i = i + 1
    end
    return ils
  end