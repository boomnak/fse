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
  nextobjectid = 8,
  properties = {},
  tilesets = {
    {
      name = "triggers",
      firstgid = 1,
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
      name = "fade",
      firstgid = 4,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/tst/fade.png",
      imagewidth = 128,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 4,
      tiles = {}
    },
    {
      name = "Fullset 01",
      firstgid = 8,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/Fullset 01.png",
      imagewidth = 512,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 256,
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
      data = "eJxjYMAEK2iMcYHhbi+p7sLnTlLAQNtLrrsoDeeBspda6ZKQ+0m1F5f+gbKX1uE0WO0l1xx6pcuBtncgAABTUKax"
    },
    {
      type = "tilelayer",
      name = "dark",
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
      data = "eJxjYMAEv2iMcYHhbi+p7sLnTlLAQNtLrrsoDeeBspda6ZKQ+0m1F5f+gbKX1uE0WO0l1xx6pcuBtncgAADybPgN"
    },
    {
      type = "tilelayer",
      name = "walls",
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
      data = "eJybwcDAMAMN0xqg2zdS7CXVXfjcSaweatg7g0Z6CLmLVDBY7CVXP7nhSq47B9peUgGp7h2s9pJrDrnuppc+atk7EBgAfJR0+Q=="
    },
    {
      type = "tilelayer",
      name = "ladders",
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
      data = "eJxjYBgFQw3sGEL2UsOtI81ecuwgxV5y3TiY7KWHflrYOxTSx1CzlxoAAORcD9E="
    },
    {
      type = "tilelayer",
      name = "doors",
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
      data = "eJxjYBgZYP4A2bt+gOwdBaNgFAwPMFp20R4AADG3Ap0="
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 896,
          y = 32,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["runOnKey"] = "up",
            ["warp"] = "'oldlibrary',128,320"
          }
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 384,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["runOnKey"] = "up",
            ["warp"] = "'throneroom',480,288"
          }
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 896,
          y = 384,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["entity"] = "true",
            ["file"] = "alexander.lua"
          }
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 736,
          y = 160,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["entity"] = "",
            ["file"] = "guard.lua"
          }
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 256,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["entity"] = "",
            ["file"] = "guard.lua"
          }
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 32,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["entity"] = "",
            ["file"] = "guard.lua"
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "fadelr",
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
      data = "eJxjYaA/YAVillF7R+0dtXfU3lF7R+0dBPYCAN9bAIg="
    },
    {
      type = "tilelayer",
      name = "fadeud",
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
      data = "eJxjY2BgYBsAPApGwSgYBaNgFCAD9gHCAAMHAYc="
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
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzNk8EKACAIQ5X+/587BRJYmxRz4CVY73nQzcybzO+ouaxX5jmIzgvu+qPCPXVuXnFfJF24bNg7GVsP5WZ9FRdN1bcjl70hxjfzjm9I1FzFTNglASA="
    }
  }
}
