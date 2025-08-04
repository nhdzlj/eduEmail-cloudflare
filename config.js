// 配置文件 - 从.env文件生成
window.ENV_CONFIG = {
    TEMP_EMAIL_CF_ZONE_ID: 'f01b7c8125a5cd6ca6016825b076f93a',
    TEMP_EMAIL_QQ_PASSWORD: 'zhjuzvbgmolrciaa',
    TEMP_EMAIL_CF_API_TOKEN: 'WGfmdA8d9nWC6vuNKKHZkEvlQS-7gKLFD6jCEN9E',
    TEMP_EMAIL_DOMAIN: 'lijun0515.xyz',
    TEMP_EMAIL_QQ_USERNAME: '3330376965@qq.com',
    TEMP_EMAIL_CHECK_INTERVAL: '10'
};

// 添加时间戳以便调试
window.ENV_CONFIG._generated = new Date().toISOString();
console.log('配置文件已加载，生成时间:', window.ENV_CONFIG._generated);