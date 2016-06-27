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
  nextobjectid = 7,
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
      name = "Fullset 01",
      firstgid = 4,
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
      name = "Tree0b",
      firstgid = 260,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/spr/Tree0b.png",
      imagewidth = 160,
      imageheight = 352,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 55,
      tiles = {}
    },
    {
      name = "tree3b",
      firstgid = 315,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../img/spr/tree3b.png",
      imagewidth = 160,
      imageheight = 352,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 55,
      tiles = {}
    },
    {
      name = "fade",
      firstgid = 370,
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
      data = "eJxzZGBgcMSCqQGwmUsMpgSI0MFeESimlr0iZOBRe2lrLzqglb34AEwNufa64sC47EV3G778QUoeIjWu8ZlHap4lx15sgNRyglR7cQFyykRy0/hIBgDSai7+"
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
      data = "eJxjYBhe4Dud7EC3hxJ7v5OBR+2lrb3Y9NLCXmL00cteUtxGLXeQGia0tHs42EuK3aMAAQDF/HW3"
    },
    {
      type = "tilelayer",
      name = "dirt",
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
      data = "eJxjYMAEIlTEpAJ620eO3djU0xuM2ksf+2htL63SMjn2EgJSQCwNxDJUNpdYO3UIyMPsE6PQbnQ7bbDIawGxNlSeGvZKodnrDcQ+RNgJs5ccu8WgZiKbC6Nh7kGWk8ZhrxgD7jSMCyObC/KvNQMknLWwYGQ/i1GIkc3TQQpnAMpjE5Q="
    },
    {
      type = "tilelayer",
      name = "grass",
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
      data = "eJxjYBgFo2AUoAMWKKaXPfSyjxIwDwnjAuj+odRP+OxCdhMut9DKTmoDatlJip/xqSUUz7jMw4dZgZiNRDPpBQCTVQfM"
    },
    {
      type = "tilelayer",
      name = "cave_wall",
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
      data = "eJxjYBgFo2AUjIJRMApGLgAABwgAAQ=="
    },
    {
      type = "tilelayer",
      name = "trees",
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
      data = "eJzt07VSREEUBNC3IbY4izuLu5Pj7u7u8P8JJ5hPmH0Rt+pUZ92TTJIU/hYzSbLEMiusZlIYdWt21tlgk62wWySLKaGUssjv2da3wy577If+rCyngkqqIu8e6DvkiGNOQn+1rKGWOnKRd0/1nXHOBZehv1420EgTzZF3r/Rdc8Mtd6G/RbbSRjsdkXfv9T3wyBPPob9TdtFND/nIuy/6XnnjnY/Q3yv76GeAwci7n/q++OaH39A/JIcZYZSxlP71uJ0JJpliOqXdGTuzzDHPQkq7/1f4+wOb5Rbq"
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
          x = 0,
          y = 32,
          width = 32,
          height = 384,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'forest1',576,256"
          }
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 928,
          y = 32,
          width = 32,
          height = 224,
          rotation = 0,
          visible = true,
          properties = {
            ["event"] = "",
            ["warp"] = "'overworld',224,352"
          }
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["entity"] = "",
            ["file"] = "slug.lua"
          }
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["entity"] = "",
            ["file"] = "slug.lua"
          }
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["entity"] = "",
            ["file"] = "slug.lua"
          }
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["entity"] = "",
            ["file"] = "slug.lua"
          }
        }
      }
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
      data = "eJwrYWRgKBkAPApGwSgYBaNgFCCDUsaBwQCyOBuL"
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
      data = "eJwrYmSgOygG2lk0au+ovaP2jto7au+ovYPAXgC2+w2K"
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
      data = "eJxjZGBgYMSDyQH4zCNkLjH24jKPXPfiMxef2ykNJ0rAqL30sY/W9lI771FiLyl6qGkuMXaS6iZqlF+UyNPbTmLVEKue1PgjtuykRdhRAwAAkp8AaQ=="
    }
  }
}
