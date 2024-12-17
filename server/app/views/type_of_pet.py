from app.core import controller

controllerClass = getattr(controller, "Controller")

# 宠物类型
class Type_of_pet(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./type_of_pet/",
            # 选择的服务
            "service": "type_of_pet",
        }
        config_temp = config
        config_temp.update(config_init)
        super(Type_of_pet , self).__init__(config_temp)


