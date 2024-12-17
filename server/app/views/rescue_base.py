from app.core import controller

controllerClass = getattr(controller, "Controller")

# 救助基地
class Rescue_base(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./rescue_base/",
            # 选择的服务
            "service": "rescue_base",
        }
        config_temp = config
        config_temp.update(config_init)
        super(Rescue_base , self).__init__(config_temp)


