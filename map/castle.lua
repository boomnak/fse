return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.15.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 15,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 9,
  properties = {},
  tilesets = {
    {
      name = "rpgtk",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tst/rpgtk.png",
      imagewidth = 544,
      imageheight = 384,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 204,
      tiles = {}
    },
    {
      name = "special",
      firstgid = 205,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tst/triggers.png",
      imagewidth = 96,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 3,
      tiles = {
        {
          id = 0,
          properties = {
            ["collidable"] = "true",
            ["solid"] = "true"
          }
        }
      }
    },
    {
      name = "entities",
      firstgid = 208,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tst/entities.png",
      imagewidth = 64,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 2,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "bg",
      x = 0,
      y = 0,
      width = 30,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzjYmBg4BrFo3gUj+JRPIpHKAYA+hMRlQ=="
    },
    {
      type = "tilelayer",
      name = "black",
      x = 0,
      y = 0,
      width = 30,
      height = 15,
      visible = true,
      opacity = 0.5,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzLYGBgyBjFo3gUD0lMLhgoeym1mxpgIOwk1R2jgL4AANDRddE="
    },
    {
      type = "tilelayer",
      name = "door",
      x = 0,
      y = 0,
      width = 30,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2AUUAoODrQDRsEoGAVkAwDa5gDC"
    },
    {
      type = "objectgroup",
      name = "object",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["file"] = "king.lua"
          }
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'overworld',480,256"
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "entities",
      x = 0,
      y = 0,
      width = 30,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2AUjIJRMNDgwkA7YAQDADvXANE="
    },
    {
      type = "tilelayer",
      name = "fg",
      x = 0,
      y = 0,
      width = 30,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2AUDFUQSCYeKHsptZsSe8m1nxp2kuoOWtk5irFjAA+cMqE="
    },
    {
      type = "tilelayer",
      name = "special",
      x = 0,
      y = 0,
      width = 30,
      height = 15,
      visible = false,
      opacity = 0.5,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = "false",
        ["special"] = "true"
      },
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2AUDFVwlkw8EGAw2E2O/dRwM6lxQKuwGqxpY6ABAIpGHNU="
    }
  }
}
