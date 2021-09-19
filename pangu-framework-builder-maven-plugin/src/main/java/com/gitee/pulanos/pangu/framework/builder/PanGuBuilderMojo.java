package com.gitee.pulanos.pangu.framework.builder;

import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.MojoFailureException;
import org.apache.maven.plugins.annotations.LifecyclePhase;
import org.apache.maven.plugins.annotations.Mojo;
import org.apache.maven.plugins.annotations.Parameter;

/**
 * maven插件入口
 *
 * @author xiongchun
 */
@Mojo(name = "builder")
public class PanGuBuilderMojo extends AbstractMojo {

    @Parameter(property = "driverName")
    private String driverName;

    @Override
    public void execute() throws MojoExecutionException, MojoFailureException {
        System.out.println(driverName);
    }
}
