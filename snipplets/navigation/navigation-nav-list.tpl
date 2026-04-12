{% set megamenu = megamenu | default(false) %}
{% set hamburger = hamburger | default(false) %}
{% set subitem = subitem | default(false) %}

{% for item in navigation %}
	{% set is_home_nav_item = not subitem and item.name == ('Inicio' | translate) %}
	{% set item_name_normalized = item.name | lower | trim %}
	{% set item_url_handle = '' %}
	{% if item.url %}
		{% set item_url_handle = item.url | trim('/') | split('/') | last | lower %}
	{% endif %}
	{% set is_info_nav_split_item = megamenu and not subitem and (item_name_normalized in ['quienes somos', 'quiénes somos'] or item_url_handle == 'quienes-somos') %}
	{% if item.subitems %}
		<li class="{% if megamenu %}js-desktop-nav-item js-item-subitems-desktop nav-item-desktop {% if not subitem %}js-nav-main-item nav-dropdown nav-main-item {% endif %}{% endif %}{% if is_info_nav_split_item %}js-nav-info-split-start {% endif %}nav-item item-with-subitems" data-component="menu.item">
			{% if megamenu %}
			<div class="nav-item-container">
			{% endif %}
				<a class="{% if hamburger %}js-toggle-menu-panel align-items-center{% endif %} nav-list-link position-relative {{ item.current ? 'selected' : '' }}" href="{% if megamenu and item.url %}{{ item.url }}{% else %}#{% endif %}"{% if is_home_nav_item %} title="{{ 'Inicio' | translate }}" aria-label="{{ 'Inicio' | translate }}"{% endif %}>
					{% if is_home_nav_item %}
						{% include "snipplets/svg/home.tpl" with {svg_custom_class: "icon-inline icon-lg icon-w"} %}
					{% else %}
						{{ item.name }}
					{% endif %}
					{% if hamburger %}
						<span class="nav-list-arrow ml-1">
							{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
						</span>
					{% endif %}
				</a>
			{% if megamenu %}
			</div>
			{% endif %}
			{% if megamenu and not subitem %}
				<div class="js-desktop-dropdown nav-dropdown-content desktop-dropdown">
			{% endif %}
					<ul class="{% if megamenu %}{% if not subitem %}desktop-list-subitems{% endif %}{% else %}js-menu-panel nav-list-panel nav-list-panel-right {% endif %} list-subitems" {% if hamburger %}style="display:none;"{% endif %}>
						{% if hamburger %}
							<div class="modal-header">
								<div class="row no-gutters">
									<div class="col">
										<a class="js-toggle-menu-back" href="#">
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<span class="modal-back">
														{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline svg-icon-text"} %}
													</span>
												</div>
												<div class="col pl-2">
													{{ item.name }}
												</div>
											</div>
										</a>
									</div>
									<div class="col-auto">
										<a class="js-toggle-menu-close js-modal-close modal-close">
											{% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline  modal-close-icon"} %}
										</a>
									</div>
								</div>
							</div>
							<div class="modal-body p-0">
								{% if item.isCategory %}
									<li class="nav-item py-1">
										<a class="nav-list-link position-relative font-small py-3 {{ item.current ? 'selected' : '' }}" href="{{ item.url }}">
											{% if item.isRootCategory %}
												{{ 'Ver todos los productos' | translate }}
											{% else %}
												{{ 'Ver todo en' | translate }} {{ item.name }}
											{% endif %}
										</a>
									</li>
								{% endif %}
						{% endif %}

						{% set hamburger_val = false %}
						{% if hamburger %}
							{% set hamburger_val = true %}
						{% endif %}
						{% include 'snipplets/navigation/navigation-nav-list.tpl' with { 'navigation' : item.subitems, 'subitem' : true, 'hamburger' : hamburger_val  } %}
						
						{% if hamburger %}
							</div>
						{% endif %}
					</ul>
			{% if megamenu and not subitem %}
					{% if megamenu %}
						{% include 'snipplets/navigation/navigation-banners.tpl' with { 'desktop' : true } %}
					{% endif %}
				</div>
			{% endif %}
		</li>
	{% else %}
		<li class="js-desktop-nav-item {% if megamenu %}{% if not subitem %}js-nav-main-item nav-main-item{% endif %} nav-item-desktop{% endif %} {% if is_info_nav_split_item %}js-nav-info-split-start {% endif %}nav-item" data-component="menu.item">
			<a class="nav-list-link {{ item.current ? 'selected' : '' }}" href="{% if item.url %}{{ item.url | setting_url }}{% else %}#{% endif %}"{% if is_home_nav_item %} title="{{ 'Inicio' | translate }}" aria-label="{{ 'Inicio' | translate }}"{% endif %}>
				{% if is_home_nav_item %}
					{% include "snipplets/svg/home.tpl" with {svg_custom_class: "icon-inline icon-lg icon-w"} %}
				{% else %}
					{{ item.name }}
				{% endif %}
			</a>
		</li>
	{% endif %}
{% endfor %}
