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
  nextobjectid = 6,
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
      name = "items",
      firstgid = 260,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/items.png",
      imagewidth = 288,
      imageheight = 320,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 90,
      tiles = {}
    },
    {
      name = "Spritesheet Placeholder",
      firstgid = 350,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 32,
      image = "../img/spr/Spritesheet Placeholder.png",
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
      name = "Tile Layer 1",
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
      data = "eJztkDEOACAIA/v/lf4AH6qDQyXi5MAAySWEUggMAKMpxa/oefXm+cI2LnDXmGieYKJrzrBLiTuy3EOv+hX1Ee/7blrsI85/qHcCV/p39A=="
    },
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
      data = "eJxjYBgFgw0sphIeNY865lHLzFFAOQAAB55EIg=="
    },
    {
      type = "tilelayer",
      name = "darkness",
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
      data = "eJxjYBgFgw18oRIeNW9wmjcKyAcADM5m8Q=="
    },
    {
      type = "tilelayer",
      name = "door",
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
      data = "eJxjYBgFo2B4gelUNm85lc0bBeQDAB/mAT8="
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
      data = "eJxjYBgFo2D4g4NYxI5QYN5FIH4ExI+R8BUKzBsFxAEAFVoGtg=="
    },
    {
      type = "tilelayer",
      name = "drinks",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 12,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFo2BkgAhGBoZIIA4AYnfGgXbNKCAHAABHqgFN"
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
      data = "eJxjYBgFlABGRupjartt1LzBZd5gTCtDBQAA6MwAaQ=="
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
          x = 352,
          y = 288,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["file"] = "summitofkings.lua",
            ["runOnLoad"] = "",
            ["runOnce"] = ""
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "entities",
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
      data = "eJxjYBgFo2BkggfMDAwPmalnnjwLA4MCC/XMGwWYAABqVwIP"
    }
  }
}
