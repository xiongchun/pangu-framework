package org.g4studio.core.mvc.xstruts.plugins;

import javax.servlet.ServletException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.mvc.xstruts.action.ActionServlet;
import org.g4studio.core.mvc.xstruts.action.PlugIn;
import org.g4studio.core.mvc.xstruts.config.ForwardConfig;
import org.g4studio.core.mvc.xstruts.config.MessageResourcesConfig;
import org.g4studio.core.mvc.xstruts.config.ModuleConfig;
import org.g4studio.core.mvc.xstruts.config.PlugInConfig;
import org.g4studio.core.mvc.xstruts.util.RequestUtils;

/**
 * <p>Convenient implementation of {@link PlugIn} that performs as many
 * verification tests on the information stored in the {@link ModuleConfig}
 * for this module as is practical.  Based on the setting of the
 * <code>fatal</code> property (which defaults to <code>true</code>), the
 * detection of any such errors will cause a <code>ServletException</code> to
 * be thrown from the <code>init</code> method, which will ultimately cause
 * the initialization of your Struts controller servlet to fail.</p>
 *
 * @version $Rev: 377024 $ $Date: 2006-02-11 12:39:19 -0700 (Sat, 11 Feb 2006) $
 * @since Struts 1.1
 */
public class ModuleConfigVerifier implements PlugIn {

    /**
     * Commons Logging instance.
     */
    private static Log LOG = LogFactory.getLog(ModuleConfigVerifier.class);

    // ----------------------------------------------------- Instance Variables

    /**
     * <p>The {@link ModuleConfig} instance for our module.</p>
     */
    protected ModuleConfig config = null;

    /**
     * <p>The {@link ActionServlet} instance we are associated with.</p>
     */
    protected ActionServlet servlet = null;

    // ------------------------------------------------------------- Properties

    /**
     * <p>Should the existence of configuration errors be fatal.</p>
     */
    private boolean fatal = true;

    /**
     * <p>Return the "configuation errors are fatal" flag.</p>
     */
    public boolean isFatal() {
        return (this.fatal);
    }

    /**
     * <p>Set the "configuration errors are fatal" flag.</p>
     *
     * @param fatal The new flag value
     */
    public void setFatal(boolean fatal) {
        this.fatal = fatal;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>Receive notification that our owning module is being shut down.</p>
     */
    public void destroy() {
        ; // No action required
    }

    // See interface for Javadoc.
    public void init(ActionServlet servlet, ModuleConfig config)
        throws ServletException {
        this.servlet = servlet;
        this.config = config;

        boolean ok = true;

        LOG.info(servlet.getInternal().getMessage("configVerifying"));

        // Perform detailed validations of each portion of ModuleConfig
        // :TODO: Complete methods to verify Action, Controller, et al, configurations.

        /*
        if (!verifyActionConfigs()) {
            ok = false;
        }
        */
        if (!verifyActionMappingClass()) {
            ok = false;
        }

        /*
        if (!verifyControllerConfig()) {
            ok = false;
        }
        if (!verifyExceptionConfigs()) {
            ok = false;
        }
        if (!verifyFormBeanConfigs()) {
            ok = false;
        }
        */
        if (!verifyForwardConfigs()) {
            ok = false;
        }

        if (!verifyMessageResourcesConfigs()) {
            ok = false;
        }

        if (!verifyPlugInConfigs()) {
            ok = false;
        }

        // Throw an exception on a fatal error
        LOG.info(servlet.getInternal().getMessage("configCompleted"));

        if (!ok && isFatal()) {
            throw new ServletException(servlet.getInternal().getMessage("configFatal"));
        }
    }

    // ------------------------------------------------------ Protected Methods

    /**
     * <p>Return <code>true</code> if information returned by
     * <code>config.getActionMappingClass</code> is all valid; otherwise, log
     * error messages and return <code>false</code>.</p>
     */
    protected boolean verifyActionMappingClass() {
        String amcName = config.getActionMappingClass();

        if (amcName == null) {
            LOG.error(servlet.getInternal().getMessage("verifyActionMappingClass.missing"));

            return (false);
        }

        try {
            Class amcClass = RequestUtils.applicationClass(amcName);
        } catch (ClassNotFoundException e) {
            LOG.error(servlet.getInternal().getMessage("verifyActionMappingClass.invalid",
                    amcName));

            return (false);
        }

        return (true);
    }

    /**
     * <p>Return <code>true</code> if information returned by
     * <code>config.findForwardConfigs</code> is all valid; otherwise, log
     * error messages and return <code>false</code>.</p>
     */
    protected boolean verifyForwardConfigs() {
        boolean ok = true;
        ForwardConfig[] fcs = config.findForwardConfigs();

        for (int i = 0; i < fcs.length; i++) {
            String path = fcs[i].getPath();

            if (path == null) {
                LOG.error(servlet.getInternal().getMessage("verifyForwardConfigs.missing",
                        fcs[i].getName()));
                ok = false;
            } else if (!path.startsWith("/")) {
                LOG.error(servlet.getInternal().getMessage("verifyForwardConfigs.invalid",
                        path, fcs[i].getName()));
            }
        }

        return (ok);
    }

    /**
     * <p>Return <code>true</code> if information returned by
     * <code>config.findMessageResourcesConfigs</code> is all valid;
     * otherwise, log error messages and return <code>false</code>.</p>
     */
    protected boolean verifyMessageResourcesConfigs() {
        boolean ok = true;
        MessageResourcesConfig[] mrcs = config.findMessageResourcesConfigs();

        for (int i = 0; i < mrcs.length; i++) {
            String factory = mrcs[i].getFactory();

            if (factory == null) {
                LOG.error(servlet.getInternal().getMessage("verifyMessageResourcesConfigs.missing"));
                ok = false;
            } else {
                try {
                    Class clazz = RequestUtils.applicationClass(factory);
                } catch (ClassNotFoundException e) {
                    LOG.error(servlet.getInternal().getMessage("verifyMessageResourcesConfigs.invalid",
                            factory));
                    ok = false;
                }
            }

            String key = mrcs[i].getKey();

            if (key == null) {
                LOG.error(servlet.getInternal().getMessage("verifyMessageResourcesConfigs.key"));
            }
        }

        return (ok);
    }

    /**
     * <p>Return <code>true</code> if information returned by
     * <code>config.findPluginConfigs</code> is all valid; otherwise, log
     * error messages and return <code>false</code>.</p>
     */
    protected boolean verifyPlugInConfigs() {
        boolean ok = true;
        PlugInConfig[] pics = config.findPlugInConfigs();

        for (int i = 0; i < pics.length; i++) {
            String className = pics[i].getClassName();

            if (className == null) {
                LOG.error(servlet.getInternal().getMessage("verifyPlugInConfigs.missing"));
                ok = false;
            } else {
                try {
                    Class clazz = RequestUtils.applicationClass(className);
                } catch (ClassNotFoundException e) {
                    LOG.error(servlet.getInternal().getMessage("verifyPlugInConfigs.invalid",
                            className));
                    ok = false;
                }
            }
        }

        return (ok);
    }
}
