<!DOCTYPE html>

<#include init />

<#assign
	include_remember_me_css = remember_me && use_sign_in_modal && !is_signed_in 
	is_widget_page = theme_display.isWidget()
	include_css = include_remember_me_css || is_widget_page
/>

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto+Mono&display=swap" rel="stylesheet">

	<@liferay_util["include"] page=top_head_include />

	<#if include_css>
    <style>
		<#if is_widget_page>
		.liferaybotics-b2b-theme-main-class header .lower-header {
		        margin-bottom: var(--spacer-5, 3rem);
		}
		</#if>

		<#if include_remember_me_css>
        .liferaybotics-b2b-theme-main-class #loginCardContainer #loginCardArea .navigation ul li:last-child {
            bottom: 206px;
        }
        
        .liferaybotics-b2b-theme-main-class #loginCardContainer #loginCardArea .login-container fieldset.fieldset .form-group:nth-child(2) {
            margin-bottom: 1.5rem;
        }

        .liferaybotics-b2b-theme-main-class #loginCardContainer #loginCardArea .login-container fieldset.fieldset .form-group:nth-child(3) {
            margin-bottom: unset;
        }
		</#if>
    </style>
    </#if>
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<div class="d-flex flex-column min-vh-100">
<#if show_control_menu == true>
	<@liferay.control_menu />
</#if>

	<div class="d-flex flex-column flex-fill liferaybotics-b2b-theme-main-class" id="wrapper">
		<#include "${full_templates_path}/portal_header.ftl" />

		<section class="${portal_content_css_class} flex-fill" id="content">
			<h2 class="sr-only" role="heading" aria-level="1">${the_title}</h2>

			<#if selectable>
				<@liferay_util["include"] page=content_include />
			<#else>
				${portletDisplay.recycle()}

				${portletDisplay.setTitle(the_title)}

				<@liferay_theme["wrap-portlet"] page="portlet.ftl">
					<@liferay_util["include"] page=content_include />
				</@>
			</#if>
		</section>

		<#include "${full_templates_path}/portal_footer.ftl" />

		<#include "${full_templates_path}/signin_modal.ftl" />		
	</div>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<#if enable_sticky_header && !css_class?contains("has-edit-mode-menu")>
	<script data-senna-track="permanent" id="stickyJS" src="${javascript_folder}/sticky.js" type="text/javascript"></script>
</#if>

</body>

</html>