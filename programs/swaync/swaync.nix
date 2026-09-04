{ pkgs, theme, ... }:

{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      control-center-width = 380;
      control-center-height = 860;
      control-center-margin-top = 2;
      control-center-margin-bottom = 2;
      control-center-margin-right = 1;
      control-center-margin-left = 0;
      timeout = 5;

      widget-config = {
        dnd = {
          text = "Do not disturb";
        };
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "󱏬";
        };
      };
    };

    style = ''
      * {
        color: #${theme.color.brightWhite};

        all: unset;
        font-size: 14px;
        font-family: "JetBrains Mono Nerd Font 10";
        transition: 200ms;
      }

      .notification-row {
        outline: none;
        margin: 0;
        padding: 0px;
      }

      .floating-notifications.background .notification-row .notification-background {
        background: #${theme.color.black};
        border-radius: 16px;
        margin: 5px;
        padding: 0;
      }

      .floating-notifications.background .notification-row .notification-background .notification {
        padding: 0px 6px;
        border-radius: 16px;
        border: 1px solid #${theme.color.blue};
      }

      .floating-notifications.background .notification-row .notification-background .notification.critical {
        border: 1px solid #${theme.color.red};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content {
        margin: 5px;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * {
        min-height: 3.4em;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action {
        border-radius: 8px;
        background-color: transparent;
        margin: 6px;
        border: 1px solid transparent;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
        background-color: transparent;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
        background-color: transparent;
      }

      .image {
        margin: 10px 20px 10px 0px;
      }

      .summary {
        font-weight: 800;
        font-size: 1rem;
      }

      .body {
        font-size: 0.8rem;
      }

      .floating-notifications.background .notification-row .notification-background .close-button {
        margin: 6px;
        padding: 2px;
        border-radius: 6px;
        background-color: transparent;
      }

      .floating-notifications.background .notification-row .notification-background .close-button:hover {
        background-color: transparent;
      }

      .floating-notifications.background .notification-row .notification-background .close-button:active {
        background-color: transparent;
      }

      .notification.critical progress {
        background-color: #${theme.color.blue};
      }

      .notification.low progress,
      .notification.normal progress {
        background-color: #${theme.color.blue};
      }

      /* CONTROL CENTER ------------------------------------------------------------------------ */

      .control-center {
        background: alpha(#${theme.color.black}, .95);
        color: #${theme.color.brightWhite};
        border-radius: 24px;
        border: 1px solid #${theme.color.blue};
        margin: 18px;
        padding: 12px;
      }

      /* Notifications  */
      .control-center .notification-row .notification-background {
        background-color: #${theme.color.black};
        border-radius: 16px;
        margin: 4px 0px;
        padding: 4px;
      }

      .control-center .notification-row .notification-background .notification {
        border-radius: 16px;
        border: 1px solid #${theme.color.blue};
      }

      .control-center .notification-row .notification-background .notification.critical {
        border-radius: 16px;
        border: 1px solid #${theme.color.red};
      }

      .control-center .notification-row .notification-background .notification .notification-content {
        margin: 6px;
        padding: 8px 6px 2px 2px;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * {
        min-height: 3.4em;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action {
        background: transparent;
        color: #${theme.color.brightWhite};
        border-radius: 12px;
        margin: 6px;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
        background: transparent;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
        background: transparent;
      }

      /* Buttons */

      /* === Notification X button === */
      .control-center .notification-row .notification-background .close-button {
        background: transparent;
        border-radius: 6px;
        color: #${theme.color.brightWhite};
        margin: 0px;
        padding: 4px;
      }

      .control-center .notification-row .notification-background .close-button:hover {
        background-color: transparent;
      }

      .control-center .notification-row .notification-background .close-button:active {
        background-color: transparent;
      }

      progressbar,
      progress,
      trough {
        border-radius: 12px;
      }

      progressbar {
        background-color: rgba(255,255,255,.1);
      }

      /* Notifications expanded-group */
      .notification-group {
        margin: 2px 8px 2px 8px;
      }

      .notification-group-headers {
        font-weight: bold;
        font-size: 1.25rem;
        color: #${theme.color.brightWhite};
        letter-spacing: 2px;
      }

      .notification-group-icon {
        color: #${theme.color.blue};
      }

      .notification-group-collapse-button,
      .notification-group-close-all-button {
        background: transparent;
        color: #${theme.color.brightWhite};
        margin: 4px;
        border-radius: 6px;
        padding: 4px;
      }

      .notification-group-collapse-button:hover,
      .notification-group-close-all-button:hover {
        background: #${theme.color.brightBlack};
      }

      /* WIDGETS --------------------------------------------------------------------------- */

      /* Notification clear button */
      .widget-title {
        font-size: 1.2em;
        margin: 6px;
      }

      .widget-title button {
        background: #${theme.color.black};
        border-radius: 6px;
        border: 1px solid #${theme.color.blue};
        padding: 4px 16px;
      }

      .widget-title button:hover {
        background-color: #${theme.color.blue};
      }

      .widget-title button:active {
        background-color: #${theme.color.brightBlue};
      }

      /* Do not disturb */
      .widget-dnd {
        margin: 6px;
        font-size: 1.2rem;
      }

      .widget-dnd > switch {
        background: #${theme.color.black};
        font-size: initial;
        border-radius: 8px;
        border: 1px solid #${theme.color.blue};
        box-shadow: none;
        padding: 2px;
      }

      .widget-dnd > switch:hover {
        background: #${theme.color.brightBlack};
      }

      .widget-dnd > switch:checked {
        background: #${theme.color.blue};
      }

      .widget-dnd > switch:checked:hover {
        background: #${theme.color.brightBlue};
      }

      .widget-dnd > switch slider {
        background: #${theme.color.brightWhite};
        border-radius: 6px;
      }
    '';
  };
}
