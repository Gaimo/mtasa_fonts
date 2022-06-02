local fonts = {}
local fontsPath = {
    --fontName = "path"
    segoe_sb = "files/seguisb.ttf",
    segoe_r = "files/segoeui.ttf",
}

local function requestFont(fontName, size, bold, quality)    

    assert(fontName, "[Error] Need a font name!")
    --assert(size and type(size) == "number", "[Error] Need a size!")

    local fontPath = fontsPath[fontName]
    assert(fontPath, "[Error] The "..fontName.." font was not found.")

    if not fonts[fontName] then 
        fonts[fontName] = {}
    end

    if not fonts[fontName][size] then 
        local font = dxCreateFont(fontPath, size or 9, bold or false, quality or "default")
        fonts[fontName][size] = {font = font, count = 1}
        return font
    else
        fonts[fontName][size].count = fonts[fontName][size].count + 1
        return fonts[fontName][size].font
    end
end

local function destroyFont(fontName, size)
    assert(size and type(size) == "number", "[Fonts]: Need a size to destroy the correct font!")
    if fonts[fontName] and fonts[fontName][size] then 
        fonts[fontName][size].count = fonts[fontName][size].count - 1

        if fonts[fontName][size].count <= 0 then 
            destroyElement(fonts[fontName][size].font)
            fonts[fontName][size] = nil
        end
    end
end