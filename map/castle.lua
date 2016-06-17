return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.15.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 22,
  height = 15,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 13,
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
        },
        {
          id = 2,
          properties = {
            ["collidable"] = "true",
            ["ladder"] = "true"
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
    },
    {
      name = "newset01",
      firstgid = 210,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tst/newset01.png",
      imagewidth = 480,
      imageheight = 128,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 60,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "bg",
      x = 0,
      y = 0,
      width = 22,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJy7ysDA8InK+CoUj5o7ai61zMUGYObiAqSaR6y5xJiPLxxIBbQyl5Ad1DAXGxiK5gIAFTbJvQ=="
    },
    {
      type = "tilelayer",
      name = "door",
      x = 0,
      y = 0,
      width = 22,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFowAV3KaRua9oZO4oGAW0BgAnZwHG"
    },
    {
      type = "tilelayer",
      name = "entities",
      x = 0,
      y = 0,
      width = 22,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo4A24MJAO2AUkAwuDrQDBikAAC+tAaI="
    },
    {
      type = "objectgroup",
      name = "object",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 9,
          name = "door",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 192,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["runOnKey"] = "up",
            ["warp"] = "'overworld',480,256"
          }
        },
        {
          id = 10,
          name = "king",
          type = "",
          shape = "rectangle",
          x = 608,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["file"] = "king.lua",
            ["oncePerCollision"] = ""
          }
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["file"] = "slugfight.lua",
            ["oncePerCollision"] = ""
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "fg",
      x = 0,
      y = 0,
      width = 22,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2Dwg6tYMD65q+gGEGEeseYSYz65dlNiD6nmUiOsKLFrKJkLAKj/XgY="
    },
    {
      type = "tilelayer",
      name = "fadelr",
      x = 0,
      y = 0,
      width = 22,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzbw0B9sBeI94yaO2ruqLmj5g4TcwElgxYY"
    },
    {
      type = "tilelayer",
      name = "fadeud",
      x = 0,
      y = 0,
      width = 22,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzbx8DAsI8GeBSMglEwCugN9tMIAwCAeCC/"
    },
    {
      type = "tilelayer",
      name = "special",
      x = 0,
      y = 0,
      width = 22,
      height = 15,
      visible = true,
      opacity = 0.5,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = "false",
        ["special"] = "true"
      },
      encoding = "base64",
      compression = "zlib",
      data = "eJw7y8DAcJZGmNpg1NyRay410995CvTiU3OeCD8QAtjcQg1zCdlDLXPx2UHLsoHWAAAR6EDk"
    }
  }
}
