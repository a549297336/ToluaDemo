require "Common/Class"
require "Common/EntityBase"
Board = Class(EntityBase)

function Board:Init()
	resMgr:LoadPrefab('test_obj', { 'LongBoard' }, function(objs)
		local obj = objs[0]
		local board = fun.get_instance(obj)
		fun.set_gameobject_pos(board,0,0,0,false)
	end)
end