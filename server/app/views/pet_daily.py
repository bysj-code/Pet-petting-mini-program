from app.core import controller

controllerClass = getattr(controller, "Controller")

# 宠物日常
class Pet_daily(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./pet_daily/",
            # 选择的服务
            "service": "pet_daily",
        }
        config_temp = config
        config_temp.update(config_init)
        super(Pet_daily , self).__init__(config_temp)


