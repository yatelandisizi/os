<?php
return [
        //签名方式,默认为RSA2(RSA2048)
        'sign_type' => "RSA2",
        //支付宝公钥
        'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr8JyZ89yARPwh5F/aZqCN9Cy4bdQirh33bbEajMSsJOFlCFfK8/adHiMs6WGOC8PYwj9V1DIpri9ij1EbFCehiPifBcIwXvBQDMZepSkrh+qO0ks5SZ8GMprHGEP2UoKFyQiQvAi3JUndT1c/yiq4/TMub1pJYwHWybPHH3eaxRGIwZp2Feh8qdOk7EZfipJU8Z6Px5fSW8Sos1iDhQg48TrW1Ouvn31KpNtesk9RI7vdewv/awPKg5HlsN2FcC16km1SvbxVGYynas1sbNc65n1oAKY3evAnEURtX+DZzbMFZzakhZDZj6/Dg0IfXS8ygO9GnCF4rptfohxQdCH2QIDAQAB",
        //商户私钥
        'merchant_private_key' => "MIIEowIBAAKCAQEAr8JyZ89yARPwh5F/aZqCN9Cy4bdQirh33bbEajMSsJOFlCFfK8/adHiMs6WGOC8PYwj9V1DIpri9ij1EbFCehiPifBcIwXvBQDMZepSkrh+qO0ks5SZ8GMprHGEP2UoKFyQiQvAi3JUndT1c/yiq4/TMub1pJYwHWybPHH3eaxRGIwZp2Feh8qdOk7EZfipJU8Z6Px5fSW8Sos1iDhQg48TrW1Ouvn31KpNtesk9RI7vdewv/awPKg5HlsN2FcC16km1SvbxVGYynas1sbNc65n1oAKY3evAnEURtX+DZzbMFZzakhZDZj6/Dg0IfXS8ygO9GnCF4rptfohxQdCH2QIDAQABAoIBAHeXVmMeexMSrzp/nPONR4eVAPKm2i3ZwO3iu5kLcW8moeCeKHTWNG3FzO879KzsEIsxhbhQ5obS811JvPH6lTLu3d/TiIimnWMCohaPZ9J3B0zZyKuPWSdBLEqeHLucLmt6kbl8TixLbRLQEyQnVshPPLIxmIcM1cCHEqvvVVUDz1OQGJpx+kb7/muOm0iEByOHmUtKFBp7yV1qG83UNU0ISZD4G0hz12HZWFPxBL6INVe2e8++uWhPvRE2zXwu2KwZ/3GHuy8Hne7UJuYLTNkCvyDAeya60gnDnhRCkUiBvbTeCIRU3/Ik02e7BCPRTYJ53nqKa5Ya91Zp9uDXLwECgYEA6zjS5POZK5lEWViZt1RN8W4jif6rYj2idBK7lWl8UG72o+tGrtDldAs2LgisZyve0ElZtNtGXK+XWnK+6nbZ4x43jccYTuIP9udMmlaCmvEddny0X3a4V9eQhjj8EKKBZUinQIBWbkyuw4oU/DODrmQvbfv4ur3Loea4TER28yECgYEAv0j5T+QpLJGHtspksKyVO+DvrsLfXfKgYDXuKjfxPm/2gGEb/M7BX8mTO8C1Rh0dSi3Rpl36YiE5Ccgo51d76zr30ujlPPZBj5DbzdWDuAQwzCjWEdGriXzWiAf3LhFTSLz9bKJr2TdFvrG0HKsXQPPfPt1LCB1J4deb5UvlNbkCgYEAzQXbdGoLUOAnngTG/u+BfHV2jpomgdudFLUbQbEPBQCjA99X3ZoA1XPMRrWSp96qODwm76fMnY8DSngHhlAPvJGi9HXb7y3Fonya3U+YSTruZk9t3GObbB1dQFC9DDbIuCJqfaMfMsat8YwSnHy+QyvZ13CvrP0vV6/FZdyrHWECgYBi+ih+7Ulc1WTK8YkOXg7OMAL1g8I+g4f2oJE+6Tl8HEUJgrYPpxAqN0xm870YrYH1WyYLFr+zPQudgyOfKQZm3llTmczcMXQVDFif9iY09n4ldc/m4n4HI0CCnNSK0s4sahYbuyNg/xeop5zR5Lmgk0/l4G2tojITmRQCnrXYiQKBgFjywmQVnDPXyKyT2jsiy0NuVnbT8a0Ad+zqrBHGBxNr76aANVunKrreLE+dXLNkWwavpdgmjwfegabM3s6firwyU5EG2y5IE9nxWE1C6uTW7opea/70CSd7En9iytHy7ZDXXj0VIJkMsDCzH+8UxpntSWJF3ptpT/QvHooc9WGi",
        //编码格式
        'charset' => "UTF-8",
        //支付宝网关
        'gatewayUrl' => "https://openapi.alipay.com/gateway.do",
        //应用ID
        'app_id' => "",
        //异步通知地址,只有扫码支付预下单可用
        'notify_url' => "http://www.baidu.com",
        //最大查询重试次数
        'MaxQueryRetry' => "10",
        //查询间隔
        'QueryDuration' => "3",
        //日志文件
        'log_file' => RUNTIME_PATH.'/log/'.date('Ym').'/'.date('d').'.log',
];