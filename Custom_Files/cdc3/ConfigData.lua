
ConfigData = {
  VERSIONS = {
    CFG = 1000,
    BF  = 8014,
    PIC = 2121,
    CDC = 1,
  },
    GPIO_OUTPUTS_5v_Digital = {
        SilkScreen_name = 'Low Voltage Solid State Relays (AC only)',
        { BF = 'PH12', Line = 'S9', Name = 'I0.RPd2', Enbl='yes'},
        { BF = 'PH13', Line = 'S10', Name = 'none', Enbl='no'},
        { BF = 'PH14', Line = 'S11', Name = '215', Enbl='yes'},
        { BF = 'PH15', Line = 'S12', Name = 'none', Enbl='no'},
    },
    GPIO_OUTPUTS_Low_Voltage_ACDC = {
        SilkScreen_name = 'Low Voltage Solid State Relays (AC/DC)',
        { BF = 'PG10', Line = 'S7', Name = 'IUIC1', Enbl='yes'},
        { BF = 'PG11', Line = 'S8', Name = 'none', Enbl='no'},
    },
    GPIO_OUTPUTS_Low_Voltage_AC_only = {
        SilkScreen_name = 'Low Voltage Solid State Relays (AC only)',
        { BF = 'PG12', Line = 'S9', Name = 'Z1SV', Enbl='yes'},
        { BF = 'PG13', Line = 'S10', Name = 'Z2SV', Enbl='yes'},
        { BF = 'PG14', Line = 'S11', Name = 'Fan2Relay', Enbl='yes'},
        { BF = 'PG15', Line = 'S12', Name = 'CPCont', Enbl='yes'},
    },
    GPIO_OUTPUTS_High_Voltage_AC = {
        SilkScreen_name = 'AC only High Voltage Solid State Relays',
        { BF = 'PG4', Line = 'S1', Name = 'WP_L1', Enbl='yes'},
        { BF = 'PG5', Line = 'S2', Name = 'WP_L2', Enbl='yes'},
        { BF = 'PG6', Line = 'S3', Name = 'RP_L1', Enbl='yes'},
        { BF = 'PG7', Line = 'S4', Name = 'RP_L2', Enbl='yes'},
        { BF = 'PG8', Line = 'S5', Name = 'Fan_L1', Enbl='yes'},
        { BF = 'PG9', Line = 'S6', Name = 'Fan_L2', Enbl='yes'},
    },
    GPIO_INPUTS_5v_Digital = {
        SilkScreen_name = 'Digital Inputs 0-5V DC',
        { BF = 'PH0', Line = '1', Name = 'SYSOFF', Enbl='yes'},
        { BF = 'PH1', Line = '2', Name = 'BYPASS', Enbl='yes'},
        { BF = 'PH2', Line = '3', Name = 'ForceMake', Enbl='yes'},
        { BF = 'PH3', Line = '4', Name = 'ForceMelt', Enbl='yes'},
        { BF = 'PH4', Line = '5', Name = 'I0.RPd3', Enbl='yes'},
        { BF = 'PH5', Line = '6', Name = 'TargetCompOn2', Enbl='yes'},
        { BF = 'PH6', Line = '7', Name = 'DRTarget1', Enbl='yes'},
        { BF = 'PH7', Line = '8', Name = 'DRTarget2', Enbl='yes'},
    },
    GPIO_INPUTS_AC_DC_Detect = {
        SilkScreen_name = 'AC/DC Detect',
        { BF = 'PF1', Line = 'I1', Name = 'Z1S1', Enbl='yes'},
        { BF = 'PF2', Line = 'I2', Name = 'none', Enbl='no'},
        { BF = 'PF3', Line = 'I3', Name = 'RDisable1', Enbl='yes'},
        { BF = 'PF4', Line = 'I4', Name = 'TargetCompOn1', Enbl='yes'},
    },
 ANALOG_TO_DIGITAL_INPUTS_1 = {
   SilkScreen_name = 'A to D Inputs (1 thru 8)',
   { Line='AI1', Name='I0.CDv', Enbl='yes', Type='V_CORRECTED', DLog=1, Coefs={'1.0','0.0','0.0','1.0','1.0',} },
   { Line='AI2', Name='I0.SYp', Enbl='yes', Type='V_LINEAR_RATIO_METRIC', DLog=1, Coefs={'1.0','250.0','-25.0','1.0','1.0',} },
   { Line='AI3', Name='I0.CSp', Enbl='no', Type='V_LINEAR_RATIO_METRIC', DLog=1, Coefs={'1.0','250.0','-25.0','1.0','1.0',} },
   { Line='AI4', Name='I0.CSt', Enbl='yes', Type='V_LINEAR_CORRECTION', DLog=1, Coefs={'100.0','0.0','1.0','1.0','1.0',} },
   { Line='AI5', Name='I0.CBt', Enbl='yes', Type='V_LINEAR_CORRECTION', DLog=1, Coefs={'100.0','0.0','1.0','1.0','1.0',} },
   { Line='AI6', Name='I0.TWt', Enbl='yes', Type='V_LINEAR_CORRECTION', DLog=1, Coefs={'100.0','0.0','1.0','1.0','1.0',} },
   { Line='AI7', Name='I0.TWl', Enbl='no', Type='V_LINEAR_CORRECTION', DLog=1, Coefs={'1.0','0.0','1.0','1.0','1.0',} },
   { Line='AI8', Name='I0.SYw', Enbl='yes', Type='V_LINEAR_CORRECTION', DLog=1, Coefs={'252.38','0.0','1.0','1.0','1.0',} },
 },
 ANALOG_TO_DIGITAL_INPUTS_2 = {
   SilkScreen_name = 'A to D Inputs (9 thru 16)',
   { Line='AI9', Name='I0.CPw', Enbl='no', Type='V_LINEAR_CORRECTION', DLog=1, Coefs={'100.15','0.0','1.0','1.0','1.0',} },
   { Line='AI10', Name='I0.CLt', Enbl='yes', Type='V_LINEAR_CORRECTION', DLog=1, Coefs={'100.0','0.0','1.0','1.0','1.0',} },
   { Line='AI11', Name='I0.WSt', Enbl='yes', Type='V_LINEAR_CORRECTION', DLog=1, Coefs={'100.0','0.0','1.0','1.0','1.0',} },
   { Line='AI12', Name='A1.SYw', Enbl='no', Type='V_LINEAR_CORRECTION', DLog=1, Coefs={'1000.0','0.0','1.0','1.0','1.0',} },
   { Line='AI13', Name='A1.BLw', Enbl='no', Type='V_LINEAR_CORRECTION', DLog=1, Coefs={'1000.0','0.0','1.0','1.0','1.0',} },
   { Line='AI14', Name='A1.CPw', Enbl='no', Type='V_LINEAR_CORRECTION', DLog=1, Coefs={'100.0','0.0','1.0','1.0','1.0',} },
   { Line='AI15', Name='5v_Ref', Enbl='yes', Type='V_CORRECTED', DLog=1, Coefs={'1.0','1.0','1.0','1.0','1.0',} },
   { Line='AI16', Name='GndRef', Enbl='yes', Type='V_CORRECTED', DLog=1, Coefs={'1.0','1.0','1.0','1.0','1.0',} },
 },
    DAC_CHANNELS = {
        SilkScreen_name = 'AC/DC Detect',
        { Line = 'A01', Name = 'RPumpV', Enbl = 'yes'},
        { Line = 'A02', Name = 'none', Enbl = 'no'},
        { Line = 'A03', Name = 'none', Enbl = 'no'},
        { Line = 'A04', Name = 'none', Enbl = 'no'},
    },
    CONTROL_VARIABLES = {
      ATOD_NumSamplesToTake = 2000,
      CompressorDelay = 300,
      ConfigurationVersion = '1d2d1d61-f4e6-4823-a7ac-eb0032013511',
      CoolByDirect = 0,
      DataLoggingFrequency = 60,
      EEV_DG = '0.0',
      EEV_Delta = '1.2',
      EEV_Hys = '0.2',
      EEV_IG = '0.005',
      EEV_IGMult = '3.5',
      EEV_IGTH = '1.0',
      EEV_PG = '0.2',
      EEV_SHspShift = '0.0',
      LowTempThreshold = 15,
      MakeEndPressure = 98.5,
      MeltEndPressure = 165,
      MeltEndWaterTemp = 48,
      NOphonehome = 0,
      PH_ResetSeconds = 28800,
      PressureTooLowCutoff = 30,
      PressureTooLowDelay = 120,
      RP_LS_Factor = 300,
      RP_PwrTH = -1,
      RP_Type = 1,
      RTU_Type = 0,
      STvid = '',
      SharedPower = 0,
      Stvid = '',
      Winterized = 0,
      float1 = 1,
      float2 = 1,
      float3 = 1,
      float4 = 1,
      float5 = 0,
      float6 = 1,
      float7 = 1,
      float8 = 1,
      float9 = 1,
      int1 = 0,
      int2 = 0,
      int3 = 0,
      int4 = 0,
      int5 = 0,
      int6 = 0,
      int7 = 0,
      int8 = 0,
      int9 = 0,
    },
SEASONS = {
  { Season=1, Smon=4, Sday=1, Emon=10, Eday=31, MTTO=180000, MTHO=270000 },
  { Season=2, Smon=11, Sday=1, Emon=3, Eday=31, MTTO=180000, MTHO=270000 },
},
MAKETIMES = {
  { Seasons=1, Days={1,1,1,1,1,1,1,}, Stime=75600, Etime=36000, DelayedMake=0 },
  { Seasons=2, Days={0,0,0,0,0,0,0,}, Stime=75600, Etime=36000, DelayedMake=0 },
},
MELTTIMES = {
  { Seasons=1, Zones={1,0,0,0,}, Days={1,1,1,1,1,1,1,}, Stime=43200, Etime=75600 },
  { Seasons=2, Zones={1,0,0,0,}, Days={1,1,1,1,1,1,1,}, Stime=39600, Etime=75600 },
},
DIRECTCOOLING = {
},
BACKUPCOOLING = {
  { Seasons=3, Zones={1,0,0,0,}, Days={1,1,1,1,1,1,1,}, Stime=0, Etime=86401 },
},
ZONEDEF = {
  { ZoneNum=1, Stages=1, Capacity=60000 },
},
ONEWIRE = {
  { Name='I0.OAt', id='2B00000239BB4528', channel=1, slot=1 },
  { Name='A1.RAt', id='7D000003615F6828', channel=7, slot=1 },
  { Name='A1.SAt', id='01000003614F6828', channel=8, slot=1 },
},
STAGE2_DUTY_CYCLE = {
  MinOff = 300,
  MinOn = 300,
  Period = 900,
  Stage1Cap = 60000,
  Stage2Cap = 60000,
},
EXTERNAL_DUTY_CYCLE = {
},
EXTERNAL_DLC = {
  { Name='11',
    UniqueID='215',
    Type='1',
    Address='3',
    Port='1',
  },
},
}
