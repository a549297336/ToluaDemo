--require "Logic/GameCore/EntityBase"
require "Logic/CtrlManager"
require "Logic/GameCore/GameScene"
require "Common/fun"
require "Controller/PromptCtrl"

local function InitViewPanels()
	for i = 1, #PanelNames do
		require ("View/"..tostring(PanelNames[i]))
	end
end

--主入口函数。从这里开始lua逻辑
function Main()	
   InitViewPanels()

--[[    this.test_class_func()
    this.test_pblua_func()
    this.test_cjson_func()
    this.test_pbc_func()
    this.test_lpeg_func()
    this.test_sproto_func()
    coroutine.start(this.test_coroutine)--]]

	--TODO 需要优化
    CtrlManager.Init()
--[[    local ctrl = CtrlManager.GetCtrl(CtrlNames.Prompt)
    if ctrl ~= nil and AppConst.ExampleMode == 1 then
        ctrl:Awake()
    end--]]
       
    Log.w('LuaFramework InitOK--->>>')	
	GameScene:Init()
	
--[[	local child1 = EntityBase:New()
	local child2 = EntityBase:New()
	child1:OnInit(1)
	child2:OnInit(2)
	child1:test_value(3)
	child2:test_value(4)
	Log.e("child1 value:"..child1.testValue.." child2 value:"..child2.testValue)
	child1.base:test_log()--调用父类log
	child1:test_log()--调用子类log
	Log.e("child1 base value:"..child1.testv.." child2 base value:"..child2.testv)--]]
end

--场景切换通知
function OnLevelWasLoaded(level)
	collectgarbage("collect")
	Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end