{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "alignment": "left",
      "segments": [
        {
          "background": "#0077c2",
          "foreground": "#ffffff",
          "leading_diamond": "\u256d\u2500\ue0b6",
          "style": "diamond",
          "template": " {{ .Name }} ",
          "type": "shell"
        },
        {
          "background": "#ef5350",
          "foreground": "#FFFB38",
          "properties": {
            "root_icon": "\uf292"
          },
          "style": "diamond",
          "template": "<parentBackground>\ue0b0</> \uf0e7 ",
          "type": "root"
        },
        {
          "background": "#444444",
          "foreground": "#E4E4E4",
          "powerline_symbol": "\ue0b0",
          "properties": {
            "style": "full"
          },
          "style": "powerline",
          "template": " {{ .Path }} ",
          "type": "path"
        },
        {
          "background": "#FFFB38",
          "background_templates": [
            "{{ if or (.Working.Changed) (.Staging.Changed) }}#ffeb95{{ end }}",
            "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#c5e478{{ end }}",
            "{{ if gt .Ahead 0 }}#C792EA{{ end }}",
            "{{ if gt .Behind 0 }}#C792EA{{ end }}"
          ],
          "foreground": "#011627",
          "powerline_symbol": "\ue0b0",
          "properties": {
            "branch_icon": "\ue725 ",
            "fetch_status": true,
            "fetch_upstream_icon": true
          },
          "style": "powerline",
          "template": " {{ .HEAD }} {{ if .Working.Changed }}{{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}<#ef5350> \uf046 {{ .Staging.String }}</>{{ end }} ",
          "type": "git"
        }
      ],
      "type": "prompt"
    },
    {
      "alignment": "right",
      "segments": [
        {
          "background": "#303030",
          "foreground": "#3C873A",
          "leading_diamond": " \ue0b6",
          "properties": {
            "fetch_package_manager": true,
            "npm_icon": " <#cc3a3a>\ue5fa</> ",
            "yarn_icon": " <#348cba>\ue6a7</>"
          },
          "style": "diamond",
          "template": "\ue718 {{ if .PackageManagerIcon }}{{ .PackageManagerIcon }} {{ end }}{{ .Full }}",
          "trailing_diamond": "\ue0b4",
          "type": "node"
        },
        {
          "background": "#40c4ff",
          "foreground": "#ffffff",
          "invert_powerline": true,
          "leading_diamond": " \ue0b6",
          "style": "diamond",
          "template": " \ue641 {{ .CurrentDate | date .Format }} ",
          "trailing_diamond": "\ue0b4",
          "type": "time"
        }
      ],
      "type": "prompt"
    },
    {
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "foreground": "#21c7c7",
          "style": "plain",
          "template": "\u2570\u2500",
          "type": "text"
        },
        {
          "foreground": "#e0f8ff",
          "foreground_templates": [
            "{{ if gt .Code 0 }}#ef5350{{ end }}"
          ],
          "properties": {
            "always_enabled": true
          },
          "style": "plain",
          "template": "\u276f ",
          "type": "status"
        }
      ],
      "type": "prompt"
    }
  ],
  "version": 2
}
