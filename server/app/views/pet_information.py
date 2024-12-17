from app.core import controller

controllerClass = getattr(controller, "Controller")

# 宠物信息
class Pet_information(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./pet_information/",
            # 选择的服务
            "service": "pet_information",
        }
        config_temp = config
        config_temp.update(config_init)
        super(Pet_information , self).__init__(config_temp)


