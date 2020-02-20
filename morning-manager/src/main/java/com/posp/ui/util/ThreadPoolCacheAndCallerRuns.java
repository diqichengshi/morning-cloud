package com.posp.ui.util;

import com.google.common.util.concurrent.ListeningExecutorService;
import com.google.common.util.concurrent.MoreExecutors;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.concurrent.*;

/**
 * 缓冲线程池
 * 适用场景：高并发削峰,执行时间短的任务
 *
 * 线程参数：核心线程0,最大线程500,空闲时间60s,同步队列
 * 默认线程工厂：pool-No.-thread-No.
 * 拒绝策略：交给调用主线程执行
 *
 * @author cuipeng 2019/11/4 17:14
 */
@Service
@Slf4j
public class ThreadPoolCacheAndCallerRuns {

    /**
     * 普通线程池
     * 适用场景：同步获取结果
     */
    private ExecutorService threadPool;

    /**
     * 添加监听的线程池
     * 适用场景：异步获取结果
     */
    private ListeningExecutorService listeningThreadPool;

    /**
     * 私有构造
     */
    private ThreadPoolCacheAndCallerRuns() {
        this.threadPool = new ThreadPoolExecutor(0,
                                                500,
                                                60L,
                                                TimeUnit.SECONDS,
                                                new SynchronousQueue<>(),
                                                Executors.defaultThreadFactory(),
                                                new CallerRunsPolicy());
        this.listeningThreadPool = MoreExecutors.listeningDecorator(this.threadPool);
    }

    /**
     * 获取普通线程池
     */
    public ExecutorService getThreadPool() {
        return this.threadPool;
    }

    /**
     * 获取添加监听的线程池
     */
    public ListeningExecutorService getListeningThreadPool() {
        return this.listeningThreadPool;
    }


    /**
     * 拒绝策略
     * 交给调用主线程执行
     */
    private class CallerRunsPolicy implements RejectedExecutionHandler {

        public CallerRunsPolicy() {
        }

        public void rejectedExecution(Runnable r, ThreadPoolExecutor e) {
            if (!e.isShutdown()) {
                r.run();
            }
        }
    }


}
