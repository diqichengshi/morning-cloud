package com.morning.zuul.config;

import com.morning.common.base.MorningResult;
import com.morning.common.base.exception.enums.SystemErrorEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.netflix.zuul.filters.route.FallbackProvider;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Component;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;

/**
 * 通讯熔断类
 *
 * @author 高峰
 * @version v1.0.1, 2018/09/12  05:35:50 下午
 */
@Component
@Slf4j
public class ServiceConsumerFallbackProvider implements FallbackProvider {
    @Override
    public ClientHttpResponse fallbackResponse() {
        return new ClientHttpResponse() {
            @Override
            public HttpStatus getStatusCode() throws IOException {
                return HttpStatus.OK;
            }

            @Override
            public int getRawStatusCode() throws IOException {
                return this.getStatusCode().value();
            }

            @Override
            public String getStatusText() throws IOException {
                return this.getStatusCode().getReasonPhrase();
            }

            @Override
            public void close() {
            }

            @Override
            public InputStream getBody() throws IOException {
                MorningResult<String> resp = MorningResult.error(SystemErrorEnum.GATEWAY_TIMEOUT_ERROR);
                return new ByteArrayInputStream(resp.toString().getBytes());
            }

            @Override
            public HttpHeaders getHeaders() {
                HttpHeaders headers = new HttpHeaders();
                MediaType mt = new MediaType("application", "json", Charset.forName("UTF-8"));

                headers.setContentType(mt);

                return headers;
            }
        };
    }

    @Override
    public ClientHttpResponse fallbackResponse(Throwable cause) {
        if ((cause != null) && (cause.getCause() != null)) {
            String reason = cause.getCause().getMessage();

            // 输出详细的回退原因
            log.info("gateway异常:{}", reason);
        }

        return fallbackResponse();
    }

    /**
     * 表明为那个服务提供回退处理，*是全部，单独配置是user-service，即serviceId
     */
    @Override
    public String getRoute() {
        return "*";
    }
}
