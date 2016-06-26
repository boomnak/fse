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
  nextobjectid = 17,
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
      data = "eJxjYBgcQJoAplQ/NnPI0UOqXkrspUQfun5CfqKFe2llLzGAFHtJkaOmvcTIk5s2CLmNGLfjs5fcvEIOoNRecgEhewnpoxSjm0WKmym1d6QBABNcFdY="
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
      data = "eJxjYBgc4DcBTKl+bOaQo4dUvZTYS4k+dP2E/EQL99LKXmIAKfaSIkdNe4mRJzdtEHIbMW7HZy+5eYUcQKm95AJC9hLSRylGN4sUN1Nq70gDAF0zyvY="
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
      data = "eJyLYWBg0BkAHIPGJwQImUcsQLaXWECJfZTYi243OQBmLz5zCcmTAmBxS0t78aUpcuwlRY6a9hIjjw+QYi8x/iLFXlyAHHuJzdvk2ktuGUXIXkrLIkIA3V5S3EypvSMNAwB6Pjhl"
    },
    {
      type = "tilelayer",
      name = "walltop",
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
      data = "eJxjYBgFIxFwo2Fqm0tLgO52Su3Dp58WYUSOO2htNj38h89ufJga5tMC0DvMCIUHLfIxsWYSikNi8EACABHDAjI="
    },
    {
      type = "tilelayer",
      name = "ladder",
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
      data = "eJxjYBgFIw3sGLV31N4hZC8hcwfKXlqBkWbvYAAAW8EH6Q=="
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
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 288,
          width = 32,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'overworld',256,352"
          }
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 928,
          y = 32,
          width = 32,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'dungeon2',32,352"
          }
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 64,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["entity"] = "",
            ["file"] = "evilguard.lua"
          }
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 352,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["entity"] = "",
            ["file"] = "evilguard.lua"
          }
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 768,
          y = 96,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["entity"] = "",
            ["file"] = "evilguard.lua"
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
      data = "eJzFlFEKACEIRJXuf+f93JBRx/GjgShIe2am2S8nRybW34FPJ2THxFSdN7F1sFaYU18Ps8q9dax/U5Ubc4W4WVwsl6mpCbeKeVLP2/uquWa46F7VfsdFilxkq+T3LLmTvjThdnlVlXG7/7pl31y252f26nilD4iaALo="
    }
  }
}
