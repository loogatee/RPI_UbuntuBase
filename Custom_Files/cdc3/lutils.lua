
local yesorno_TRANS =
{
    Yes = 1,
    yes = 1,
    No  = 0,
    no  = 0
}

local THE_FILENAME="/usr/share/monkey/cdcX/ConfigData.lua"

local AD_NAME_TRANS =
{
    ['I0.CDv'] = 1,
    ['I0.SYp'] = 2,
    ['I0.CSp'] = 3,
    ['I0.CSt'] = 4,
    ['I0.CBt'] = 5,
    ['I0.TWt'] = 6,
    ['I0.TWl'] = 7,
    ['I0.SYw'] = 8,
    ['I0.CPw'] = 9,
    ['I0.CLt'] = 10,
    ['I0.WSt'] = 11,
    ['A1.SYw'] = 12,
    ['A1.BLw'] = 13,
    ['A1.CPw'] = 14,
    ['A2.SYw'] = 15,
    ['A2.BLw'] = 16,
    ['A2.CPw'] = 17,
    ['5v_Ref'] = 18,
    ['GndRef'] = 19
}

local V_TYPES_TRANS =
{
    ['V_CORRECTED']           = 1,
    ['V_LINEAR_CORRECTION']   = 3,
    ['V_LINEAR_RATIO_METRIC'] = 5
}

--
-- { Line='AI1', Name='I0.CDv', Enbl='yes', Type='V_CORRECTED', DLog=1, Coefs={'1.0','0.0','0.0','1.0','1.0',} }
--
function lua_Get_AD_Config()
    local coef1,coef2
    local T = {}

    dofile(THE_FILENAME)

    for k,W in pairs({ConfigData.ANALOG_TO_DIGITAL_INPUTS_1,ConfigData.ANALOG_TO_DIGITAL_INPUTS_2}) do
        for i,V in ipairs(W) do
            T[#T+1] = AD_NAME_TRANS[V.Name]
            T[#T+1] = yesorno_TRANS[V.Enbl]
            T[#T+1] = V_TYPES_TRANS[V.Type]
            if V.Name == 'I0.SYw' then coef1=V.Coefs[1] end
            if V.Name == 'I0.CPw' then coef2=V.Coefs[1] end
        end
    end

    T[#T+1] = tonumber(coef1)*100
    T[#T+1] = tonumber(coef2)*100

    return T
end




function lua_Get_AD_Names()
    local T = {}

    dofile(THE_FILENAME)

    for k,W in pairs({ConfigData.ANALOG_TO_DIGITAL_INPUTS_1,ConfigData.ANALOG_TO_DIGITAL_INPUTS_2}) do
        for i,V in ipairs(W) do
            T[#T+1] = V.Name
        end
    end

    return T
end






