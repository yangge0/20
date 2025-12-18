local Windows = GameMain:GetMod("Windows")
local tbWindow = Windows:CreateWindow("JYSUIWindow")

tbWindow.current_multiplier = 1

function tbWindow:ShowView(building)
    self.building = building
    tbWindow:Show()
end

function tbWindow:OnInit()
    self.window.contentPane = UIPackage.CreateObject("JYSUI", "JYSUIWindow")
    self.window.closeButton = self:GetChild("frame"):GetChild("n5")
    self.window:Center()
    
    local beishuText = self:GetChild("beishu")
    beishuText.text = self.current_multiplier.."倍购买"

    local btn1 = self:GetChild("1bei")
    local btn5 = self:GetChild("5bei")
    local btn10 = self:GetChild("10bei")
    local btn100 = self:GetChild("100bei")
    local btnxvzhi = self:GetChild("xvzhi")

    btn1.title = "一倍购买"
    btn5.title = "五倍购买"
    btn10.title = "十倍购买"
    btn100.title = "百倍购买"
    btnxvzhi.title = "使用须知"

    btn1.onClick:Add(function() 
        self.current_multiplier = 1 
        self:UpdateMultiplierDisplay()
    end)
    
    btn5.onClick:Add(function() 
        self.current_multiplier = 5 
        self:UpdateMultiplierDisplay()
    end)
    
    btn10.onClick:Add(function() 
        self.current_multiplier = 10 
        self:UpdateMultiplierDisplay()
    end)
    
    btn100.onClick:Add(function() 
        self.current_multiplier = 100 
        self:UpdateMultiplierDisplay()
    end)

    btnxvzhi.onClick:Add(function()     
        world:ShowMsgBox("多次购买蛟龙或者凤凰蛋孵化后是否会有bug暂时不知道，不建议尝试。\n不要反复ABAB的切换购买，容易点击后不进行购买判定。\n有些1灵石的物资购买了可能是给2个甚至5个物品，自己买一次测试一下，别买多了。","使用须知")
    end)

    self.itemData_origin = {
        --灵晶
        {id = "Item_LingCrystal", count = 1, pay = 110},        --灵晶
        --木材类
        {id = "Item_Wood", count = 10, pay = 1},                --原木
        {id = "Item_HardWood", count = 1, pay = 5},             --金丝灵木
        {id = "Item_LingWood", count = 1, pay = 50},            --灵木
        {id = "Item_ParasolWood", count = 1, pay = 1500},       --梧桐神木
        --石头类
        {id = "Item_Marble", count = 5, pay = 1},               --大理石
        {id = "Item_Jade", count = 3, pay = 1},                 --玉石
        {id = "Item_JadeEssence", count = 1, pay = 50},         --玉髓
        {id = "Item_StoneEssence", count = 1, pay = 25},        --石髓
        {id = "Item_SkyStone", count = 1, pay = 1500},          --天柱石
        {id = "Item_ExtremeJade", count = 1, pay = 4000},       --千棱神玉
        --矿石类
        {id = "Item_Cinnabar", count = 1, pay = 1},             --朱砂
        {id = "Item_CopperRock", count = 1, pay = 25},          --火铜矿石
        {id = "Item_SilverRock", count = 1, pay = 25},          --寒晶矿石
        {id = "Item_DarksteelRock", count = 1, pay = 15},       --玄铁矿石
        {id = "Item_StarEssence", count = 1, pay = 1500},       --星髓
        --皮毛类
        {id = "Item_Cotton", count = 5, pay = 1},               --棉花
        {id = "Item_FeiLeather", count = 1, pay = 25},          --蜚之皮   
        {id = "Item_LuShuLeather", count = 1, pay = 25},        --鹿蜀之皮
        {id = "Item_YaoLeather", count = 1, pay = 25},          --妖化的兽皮    
        {id = "Item_YaoLeather1", count = 1, pay = 60},         --妖兽的韧皮    
        --食物类
        {id = "Item_ChickenEgg", count = 2, pay = 1},           --鸡蛋
        {id = "Item_ChickenMeat", count = 5, pay = 1},          --鸡肉
        {id = "Fish_SkySnake", count = 1, pay = 10},            --云鳝
        {id = "Item_Ginkgo", count = 10, pay = 1},               --银杏果
        --种植物类
        {id = "Item_WuDang_HuangJing", count = 2, pay = 1},     --黄精
        {id = "Item_Ginseng", count = 1, pay = 1},              --人参
        {id = "Item_RedGinseng", count = 1, pay = 12},          --赤参
        {id = "Item_GanodermaLucidum", count = 1, pay = 1},     --芝草
        {id = "Item_PurpleGanodermaLucidum", count = 1, pay = 12}, --紫芝
        {id = "Item_Mint", count = 1, pay = 1},                 --清心草
        {id = "Item_MagicHerb", count = 1, pay = 1},            --灵仙草
        {id = "Item_StoneEssenceDrug", count = 1, pay = 1},     --石髓散
        
        --妖兽血魂
        {id = "Item_MonsterBlood", count = 1, pay = 249},       --妖灵血
        {id = "Item_SoulCrystalNing", count = 1, pay = 25},     --宁珀
        {id = "Item_SoulCrystalLing", count = 1, pay = 25},     --灵珀
        {id = "Item_SoulCrystalYou", count = 1, pay = 60},      --幽珀
        {id = "Item_Yao_CatSoul", count = 1, pay = 1500},       --猫妖之珀
        {id = "Item_SoulCrystalYuanLing", count = 1, pay = 6500}, --元灵之珀

        {id = "Item_JinEssence", count = 1, pay = 4000},        --琅琊果
        {id = "Item_MuEssence", count = 1, pay = 4000},         --木枯藤
        {id = "Item_ShuiEssence", count = 1, pay = 4000},       --五色金莲
        {id = "Item_HuoEssence", count = 1, pay = 4000},        --朱果
        {id = "Item_TuEssence", count = 1, pay = 4000},         --赭黄精
        
        {id = "Item_LingMuXueJie", count = 1, pay = 249},       --灵木血竭
        {id = "Item_SoulPearl", count = 1, pay = 1250},         --玄牝珠
        {id = "Item_EarthEssence", count = 1, pay = 1250},      --地母灵液
        {id = "Item_EarthEssence1", count = 1, pay = 1250},     --邪脉血泉
        {id = "Item_LifeStream", count = 1, pay = 1250},        --长生泉
        {id = "Item_EarthEssence_1", count = 1, pay = 1500},    --灵髓脂
        {id = "Item_EarthEssence1_1", count = 1, pay = 1500},   --血髓脂

        {id = "Item_ZaoHuaYuLu", count = 1, pay = 7500},        --造化玉露
        {id = "Item_ThunderAir", count = 1, pay = 7500},        --天劫之息
        {id = "Item_XianBone", count = 1, pay = 7500},          --仙人遗骨
        {id = "Item_XianBoneBall", count = 1, pay = 7500},      --神舍利
        {id = "Item_ZaoHuaYuZi", count = 1, pay = 7500},        --造化玉籽

        {id = "Item_BenYuan_None", count = 1, pay = 4000},      --天道本源-无
        {id = "Item_BenYuan_Jin", count = 1, pay = 4000},       --天道本源-金
        {id = "Item_BenYuan_Mu", count = 1, pay = 4000},        --天道本源-木
        {id = "Item_BenYuan_Shui", count = 1, pay = 4000},      --天道本源-水
        {id = "Item_BenYuan_Huo", count = 1, pay = 4000},       --天道本源-火
        {id = "Item_BenYuan_Tu", count = 1, pay = 4000},        --天道本源-土

        {id = "Item_YuanHunLu", count = 1, pay = 4000},         --元魂露
        {id = "Item_XieHunLu", count = 1, pay = 4000},          --邪魂露
        {id = "Item_XianDaoShenNian", count = 1, pay = 4000},   --仙识神念
        {id = "Item_XianDaoXieNian", count = 1, pay = 4000},    --仙识邪念
        {id = "Item_YanDaoGuo", count = 1, pay = 8000},         --演道果
        {id = "Item_QieDaoGuo", count = 1, pay = 8000},         --窃道果

        {id = "Item_Dan_WuQiNoHunger2", count = 1, pay = 35},   --五气辟谷丹
        {id = "Item_Dan_SanHuaHuangJing", count = 1, pay = 175}, --三花黄精丸

        {id = "Item_Dan_CureFiveElementDamage", count = 1, pay = 300}, --五方化伤丹
        {id = "Item_Dan_LingYuanSha", count = 1, pay = 1750},   --造化玉砂
        {id = "Item_Dan_ExtremeLofty", count = 1, pay = 5000},  --造化神丹
        {id = "Item_Dan_TreeEXP", count = 1, pay = 5000},       --天道神丹
        {id = "Item_Dan_LingYuanZhong", count = 1, pay = 10000}, --灵源种
        --凤凰材料类
        {id = "Item_BossFeng_Meat", count = 1, pay = 249},      --凶凤的血肉
        {id = "Item_BossFeng_HuoYu", count = 1, pay = 2000},    --炽烈的火羽
        {id = "Item_BossFeng_GangYu", count = 1, pay = 3000},   --凶凤的刚羽
        {id = "Item_BossFeng_Gu", count = 1, pay = 3000},       --凶凤的坚空骨
        {id = "Item_BossFeng_TouYu", count = 1, pay = 4000},    --凶凤的烬灭羽
        {id = "Item_BossFeng_WeiYu", count = 1, pay = 4000},    --凶凤的蔽天羽
        {id = "Item_BossFeng_HongYu", count = 1, pay = 8000},   --凶凤的真焱玉
        --蛟龙材料类
        {id = "Item_BossLong_Meat", count = 1, pay = 249},      --蛟龙的血肉
        {id = "Item_DragonScale", count = 1, pay = 2000},       --脱落的龙鳞
        {id = "Item_BossLong_Zhua", count = 1, pay = 3000},     --蛟龙的罗刹爪
        {id = "Item_BossLong_Lin", count = 1, pay = 3000},      --蛟龙的玄鳞
        {id = "Item_BossLong_Jiao", count = 1, pay = 4000},     --蛟龙的天角
        {id = "Item_BossLong_Jing", count = 1, pay = 4000},     --蛟龙的崩天筋
        {id = "Item_BossLong_NiLin", count = 1, pay = 8000},    --蛟龙的逆鳞
        --烛龙材料类
        {id = "Item_BossZhuLong_Meat", count = 1, pay = 249},   --原初血肉
        {id = "Item_BossZhuLong_BaiLin", count = 1, pay = 3000},--洁白的大鳞
        {id = "Item_BossZhuLong_HeiLin", count = 1, pay = 3000},--漆黑的大鳞
        {id = "Item_BossZhuLong_Eye", count = 1, pay = 4000},   --阴阳之结晶
        {id = "Item_BossZhuLong_TianLin", count = 1, pay = 4000},--烛龙的天鳞
        {id = "Item_BossZhuLong_LongYu", count = 1, pay = 8000},--混沌的龙玉
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --
        --{id = "Item_Cinnabar", count = 1, pay = 1}, --

        --双蛋
        {id = "Item_LongEgg", count = 1, pay = 100000},         --蛟龙的卵
        {id = "Item_FengEgg", count = 1, pay = 100000},         --凤凰的卵
        --粪便
        {id = "Item_DragonShit", count = 1, pay = 250},     --天龙砂
        {id = "Item_Shit", count = 1, pay = 5},             --粪便
    }
    
    self.list = self:GetChild("list")
    self.list.onClickItem:Add(function(context)
        ClickSelectItem(context)
    end)
    self:RefreshItemList()
end

function tbWindow:UpdateMultiplierDisplay()
    local beishuText = self:GetChild("beishu")
    beishuText.text = self.current_multiplier.."倍购买"
    self:RefreshItemList()
end

function tbWindow:RefreshItemList()
    self.list:RemoveChildrenToPool()
    
    for _, data in ipairs(self.itemData_origin) do
        local thingDef = ThingMgr:GetDef(g_emThingType.Item, data.id)
        if thingDef then
            local item = self.list:AddItemFromPool()

            item.name = thingDef.ThingName
            item.icon = thingDef.TexPath
            item.tooltips = thingDef.Desc

            item.data = {
                id = data.id,
                count = data.count * self.current_multiplier,
                price = data.pay * self.current_multiplier
            }
            item.title = item.data.price.."灵石"
            item:GetChild("name").text = thingDef.ThingName
        else
            print("错误：找不到物品定义 - "..data.id)
        end
    end
end

function ClickSelectItem(context)
    local item = context.data
    
    if item and item.data then
        local pay = item.data.price
        local zongliang = World.Warehouse:GetItemCount("Item_LingStone") - World.map:GetSpaceRingItemCount("Item_LingStone")

        if not tbWindow.building or not tbWindow.building.Key then
            print("错误：交易建筑未初始化")
            return
        end

        if zongliang >= pay then
            local remaining = pay
            local thingList = ThingMgr:GetThingList(g_emThingType.Item)
            
            for i = 0, thingList.Count -1 do
                local thing = thingList[i]
                if thing.def.Name == "Item_LingStone" then
                    local taken = math.min(remaining, thing.FreeCount)
                    thing:SubCount(taken)
                    remaining = remaining - taken
                    
                    if remaining <= 0 then
                        Map:DropItems(
                            item.data.id,
                            nil,
                            item.data.count,
                            tbWindow.building.Key,
                            true, 
                            true
                        )
                        print("成功购买 "..item.data.count.."个 "..item.data.id)
                        break
                    end
                end
            end
            
            if remaining > 0 then
                print("错误：灵石扣除未完成，剩余："..remaining)
            end
        else
            local thingDef = ThingMgr:GetDef(g_emThingType.Item, item.data.id)
            world:ShowMsgBox(thingDef.ThingName.." 需要"..pay.."灵石，你的灵石不足哦~","交易失败")
        end
    else
        print("错误：物品数据无效")
    end
end

function tbWindow:OnUpdate(dt)
    self:GetChild("n6").text = World.Warehouse:GetItemCount("Item_LingStone") - World.map:GetSpaceRingItemCount("Item_LingStone")
end