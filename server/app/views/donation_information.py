from app.core import controller

controllerClass = getattr(controller, "Controller")

# 捐助信息
class Donation_information(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./donation_information/",
            # 选择的服务
            "service": "donation_information",
        }
        config_temp = config
        config_temp.update(config_init)
        super(Donation_information , self).__init__(config_temp)


