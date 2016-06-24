return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.15.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 15,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 3,
  properties = {},
  tilesets = {
    {
      name = "Fullset 01",
      firstgid = 1,
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
    },
    {
      name = "triggers",
      firstgid = 257,
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
      firstgid = 260,
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
      name = "Spritesheet Placeholder1",
      firstgid = 264,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/spr/Spritesheet Placeholder1.png",
      imagewidth = 2048,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 1024,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "bg",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYECAhWRiXGDUvFHzRs0bBdQEAF50YNs="
    },
    {
      type = "tilelayer",
      name = "dark",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYECAL2RiXGDUvFHzRs0bBdQEAAWbksk="
    },
    {
      type = "tilelayer",
      name = "walls",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJybyMDAMBGKyQUTceBR80bNGzUPt3mjmHQMAP8pUrM="
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
          x = 416,
          y = 288,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["file"] = "throneroom.lua",
            ["runOnLoad"] = "",
            ["runOnce"] = ""
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "king",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2Bkg5PMDAynmKlnHicLAwMXC/XMGwUIAADR1AG1"
    },
    {
      type = "tilelayer",
      name = "fg",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2AUFFHZvCYqmzcKIAAAcD8A9Q=="
    },
    {
      type = "tilelayer",
      name = "fadeud",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjY2RgYKMiHgWjYBSMAhhgZ6QuBgCaXgEt"
    },
    {
      type = "tilelayer",
      name = "fadelr",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYWSgGmAFmsUyat6oeaPmjZpHI/MAhmkApg=="
    },
    {
      type = "tilelayer",
      name = "special",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = false,
      opacity = 0.5,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYIAARkbKMDrAJkYsGDVv1LyRYB4189tIAQAp2wBp"
    }
  }
}
