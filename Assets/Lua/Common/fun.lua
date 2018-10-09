Log = {}
fun = {}
--输出日志--
function Log.i(str)
    Util.Log(str)
end

--错误日志--
function Log.e(str) 
	Util.LogError(str)
end

--警告日志--
function Log.w(str) 
	Util.LogWarning(str)
end

function trace_back(msg)
    Log.e("LUA ERROR: " .. tostring(msg) .. "\n")
    Log.e(debug.traceback())
end

--查找对象--
function find(str)
	return GameObject.Find(str)
end

function destroy(obj)
	GameObject.Destroy(obj)
end

function newObject(prefab)
	return GameObject.Instantiate(prefab)
end

--创建面板--
function createPanel(name)
	PanelManager:CreatePanel(name)
end

function child(str)
	return transform:FindChild(str)
end

function subGet(childNode, typeName)		
	return child(childNode):GetComponent(typeName)
end

function findPanel(str) 
	local obj = find(str)
	if obj == nil then
		error(str.." is null")
		return nil
	end
	return obj:GetComponent("BaseLua")
end

--------Unity接口

function fun.get_instance(go,name)
	local ins = UnityEngine.GameObject.Instantiate(go.gameObject)
	if name then ins.name = name end
	return ins
end

function fun.set_gameobject_pos(obj,x,y,z,isLocal)
	if(isLocal ~= true) then
		obj.transform.position = Vector3.New(x,y,z)
	else
		obj.transform.localPosition = Vector3.New(x,y,z)
	end
end

function fun.get_gameobject_pos(obj,isLocal)
	if(isLocal ~= true) then
		return obj.transform.position
	else
		return obj.transform.localPosition
	end
end

function fun.set_gameobject_rot(obj,x,y,z,isLocal)
	if(isLocal ~= true) then
		obj.transform.eulerAngles = Vector3.New(x,y,z)
	else
		obj.transform.localEulerAngles = Vector3.New(x,y,z)
	end
end

function fun.get_gameobject_rot(obj,isLocal)
	if(isLocal ~= true) then
		return obj.transform.eulerAngles
	else
		return obj.transform.localEulerAngles
	end
end

function fun.set_gameobject_scale(obj,x,y,z)
	obj.transform.localScale = Vector3.New(x,y,z)
end

function fun.get_gameobject_scale(obj,isLocal)
	if(isLocal ~= true) then
		return obj.transform.lossyScale
	else
		return obj.transform.localScale
	end
end