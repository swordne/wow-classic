 if (GetLocale() == "zhCN") then REPAIRHELPER_FORMAT_MONEY_GOLD = "你在修理上面花费了%d金币%d银币%d铜币%s。"; REPAIRHELPER_FORMAT_MONEY_SILVER = "你在修理上面花费了%d银币%d铜币%s。"; REPAIRHELPER_FORMAT_MONEY_COPPER = "你在修理上面花费了%d铜币%s。"; REPAIRHELPER_GUILD_MONEY = "(公会资金)"; elseif (GetLocale() == "zhTW") then REPAIRHELPER_FORMAT_MONEY_GOLD = "你在修理上面花費了%d金幣%d銀幣%d銅幣。%s"; REPAIRHELPER_FORMAT_MONEY_SILVER = "你在修理上面花費了%d銀幣%d銅幣。%s"; REPAIRHELPER_FORMAT_MONEY_COPPER = "你在修理上面花費了%d銅幣。%s"; REPAIRHELPER_GUILD_MONEY = "(公會資金)"; else REPAIRHELPER_FORMAT_MONEY_GOLD = "You have spared %d gold %d silver %d copper coins on repair.%s"; REPAIRHELPER_FORMAT_MONEY_SILVER = "You have spared %d silver %d copper coins on repair.%s"; REPAIRHELPER_FORMAT_MONEY_COPPER = "You have spared %d copper coins on repair.%s"; REPAIRHELPER_GUILD_MONEY = "(Guild Money)"; end local RepairHelper_f831a0c20ec91ce93b4bf887d6f745ce = BLibrary("BEvent"); local function RepairHelper_a7d9def48402c73415fe545d8e2a64fb(RepairHelper_2361bab8b48b1041ad740bb561b21aee, RepairHelper_eaa9453bc0bc57c351d07355f7fb5126) local RepairHelper_f4e13e8ecf20422833dd2d694a22bf40 = tonumber(RepairHelper_2361bab8b48b1041ad740bb561b21aee); if ( RepairHelper_f4e13e8ecf20422833dd2d694a22bf40 == nil ) then return nil; end local RepairHelper_e8b199d6656a0d100a2cef18cd77aef5 = math.floor(RepairHelper_f4e13e8ecf20422833dd2d694a22bf40/10000); RepairHelper_f4e13e8ecf20422833dd2d694a22bf40 = RepairHelper_f4e13e8ecf20422833dd2d694a22bf40 - RepairHelper_e8b199d6656a0d100a2cef18cd77aef5*10000; local RepairHelper_24a4201c549bfbd7ba558ebfca17c262 = math.floor(RepairHelper_f4e13e8ecf20422833dd2d694a22bf40/100); RepairHelper_f4e13e8ecf20422833dd2d694a22bf40 = RepairHelper_f4e13e8ecf20422833dd2d694a22bf40 - RepairHelper_24a4201c549bfbd7ba558ebfca17c262*100; local RepairHelper_1212036899db090a683c1f070e6c4196 = RepairHelper_f4e13e8ecf20422833dd2d694a22bf40; local RepairHelper_c073decd77f86a53128a189abe1f48ec; local RepairHelper_e2cec61c0df9d482a10f1e51cae1e21b = ""; if (RepairHelper_eaa9453bc0bc57c351d07355f7fb5126) then RepairHelper_e2cec61c0df9d482a10f1e51cae1e21b = REPAIRHELPER_GUILD_MONEY; end if ( RepairHelper_e8b199d6656a0d100a2cef18cd77aef5 > 0 ) then RepairHelper_c073decd77f86a53128a189abe1f48ec = string.format(REPAIRHELPER_FORMAT_MONEY_GOLD, RepairHelper_e8b199d6656a0d100a2cef18cd77aef5, RepairHelper_24a4201c549bfbd7ba558ebfca17c262, RepairHelper_1212036899db090a683c1f070e6c4196, RepairHelper_e2cec61c0df9d482a10f1e51cae1e21b); elseif ( RepairHelper_24a4201c549bfbd7ba558ebfca17c262 > 0 ) then RepairHelper_c073decd77f86a53128a189abe1f48ec = string.format(REPAIRHELPER_FORMAT_MONEY_SILVER, RepairHelper_24a4201c549bfbd7ba558ebfca17c262, RepairHelper_1212036899db090a683c1f070e6c4196, RepairHelper_e2cec61c0df9d482a10f1e51cae1e21b); elseif ( RepairHelper_1212036899db090a683c1f070e6c4196 > 0 ) then RepairHelper_c073decd77f86a53128a189abe1f48ec = string.format(REPAIRHELPER_FORMAT_MONEY_COPPER, RepairHelper_1212036899db090a683c1f070e6c4196, RepairHelper_e2cec61c0df9d482a10f1e51cae1e21b); end return RepairHelper_c073decd77f86a53128a189abe1f48ec; end function RepairHelper_f831a0c20ec91ce93b4bf887d6f745ce.MERCHANT_SHOW() if ( CanMerchantRepair() ) then local RepairHelper_e8a118e3fcc8b4ab3118d4ed4fe6716a, RepairHelper_891a570f5e167d7abb5223e5b1e25754 = GetRepairAllCost(); if ( RepairHelper_891a570f5e167d7abb5223e5b1e25754 and RepairHelper_e8a118e3fcc8b4ab3118d4ed4fe6716a > 0) then local useGuildMoney,bRepaie; if RepairHelper_2b7a1fd1d54718ee9dae5e165422107e and CanGuildBankRepair and CanGuildBankRepair() then local amount = GetGuildBankWithdrawMoney(); local guildBankMoney = GetGuildBankMoney(); if ( amount == -1 ) then amount = guildBankMoney; else amount = min(amount, guildBankMoney); end if amount >= RepairHelper_e8a118e3fcc8b4ab3118d4ed4fe6716a then RepairAllItems(1); useGuildMoney = true; bRepaie =true elseif RepairHelper_7b378068bdf69ccd777bf122fb43593c and amount<RepairHelper_e8a118e3fcc8b4ab3118d4ed4fe6716a then RepairAllItems(); bRepaie =true; end else RepairAllItems(); bRepaie =true; end if bRepaie then local moneyString = RepairHelper_a7d9def48402c73415fe545d8e2a64fb(RepairHelper_e8a118e3fcc8b4ab3118d4ed4fe6716a, useGuildMoney); if moneyString then ChatFrame1:AddMessage(moneyString, 1.0, 1.0, 0.0); end end end end end function RepairHelper_ToggleEnable(RepairHelper_7739b813d90aed43ab9d0eb84ec1c1ae) if ( RepairHelper_7739b813d90aed43ab9d0eb84ec1c1ae == 1 ) then RepairHelper_f831a0c20ec91ce93b4bf887d6f745ce:RegisterEvent("MERCHANT_SHOW"); else RepairHelper_f831a0c20ec91ce93b4bf887d6f745ce:UnregisterEvent("MERCHANT_SHOW"); end end function RepairHelper_ToggleUseGuild(RepairHelper_7739b813d90aed43ab9d0eb84ec1c1ae) if ( RepairHelper_7739b813d90aed43ab9d0eb84ec1c1ae == 1 ) then RepairHelper_2b7a1fd1d54718ee9dae5e165422107e = 1; else RepairHelper_2b7a1fd1d54718ee9dae5e165422107e = nil; end end function RepairHelper_ToggleUseSelfMoneyAuto(RepairHelper_7739b813d90aed43ab9d0eb84ec1c1ae) if ( RepairHelper_7739b813d90aed43ab9d0eb84ec1c1ae == 1 ) then RepairHelper_7b378068bdf69ccd777bf122fb43593c = 1; else RepairHelper_7b378068bdf69ccd777bf122fb43593c = nil; end end 
