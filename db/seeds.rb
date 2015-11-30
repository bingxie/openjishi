# Import categories
c1 = Category.create(name: '数码相机', slug: 'digital-cameras')
c1.children.create(name: '便携数码', slug: 'compact-cameras', rank:1)
c1.children.create(name: '单反相机', slug: 'dslr', rank:2)
c1.children.create(name: '单电/微单', slug: 'mirroless', rank:3)
c1.children.create(name: '旁轴数码', slug: 'rangefinder', rank:4)
c1.children.create(name: '数码后背', slug: 'digital-back', rank:5)
c1.children.create(name: '中大画幅', slug: 'large-format', rank:6)

c2 = Category.create(name: '数码摄像机', slug: 'camcorders')
c2.children.create(name: '家用摄像机', slug: 'consumer-camcorder', rank:1)
c2.children.create(name: '运动摄像机', slug: 'sports-camcorder', rank:2)
c2.children.create(name: '专业摄像机', slug: 'pro-camcorder', rank:3)
c2.children.create(name: '遥控航拍摄像机', slug: 'aerial-camcorder', rank:4)

c3 = Category.create(name: '镜头', slug: 'lenses')
c3.children.create(name: '单反镜头', slug: 'dslr-lenses', rank:1)
c3.children.create(name: '单电/微单镜头', slug: 'mirroless-lenses', rank:2)
c3.children.create(name: '旁轴镜头', slug: 'rangefinder-lenses', rank:3)
c3.children.create(name: '电影镜头', slug: 'cine-lenses', rank:4)
c3.children.create(name: '中大画幅镜头', slug: 'large-format-lenses', rank:5)
c3.children.create(name: '特效镜头', slug: 'special-lenses', rank:6)

c4 = Category.create(name: '摄影箱包', slug: 'bags-and-cases')
c4.children.create(name: '相机背包', slug: 'backpacks', rank:1)
c4.children.create(name: '便携小包', slug: 'small-bags', rank:2)
c4.children.create(name: '保护箱', slug: 'cases', rank:3)
c4.children.create(name: '防潮箱', slug: 'dry-cabinets', rank:4)
c4.children.create(name: '设备保护', slug: 'gear-protection', rank:5)
c4.children.create(name: '配件', slug: 'bags-cases-accessories', rank:6)

c5 = Category.create(name: '脚架云台', slug: 'trippods-support')
c5.children.create(name: '三脚架', slug: 'tripods', rank:1)
c5.children.create(name: '独脚架', slug: 'monopods', rank:2)
c5.children.create(name: '云台', slug: 'heads', rank:3)
c5.children.create(name: '脚架配件', slug: 'tripods-accesseories', rank:4)
c5.children.create(name: '云台配件', slug: 'head-accessories', rank:5)
c5.children.create(name: '小型设备支架', slug: 'small-support', rank:6)

c6 = Category.create(name: '闪光灯', slug: 'flashs')
c6.children.create(name: '机顶闪光灯', slug: 'on-camera-flash', rank:1)
c6.children.create(name: '闪光灯配件', slug: 'flash-accessories', rank:2)
c6.children.create(name: '机顶照明', slug: 'on-camera-light', rank:3)
c6.children.create(name: '遥控闪光', slug: 'remote-flash', rank:4)
c6.children.create(name: '电源附件', slug: 'power-accessories', rank:5)
c6.children.create(name: '闪光灯支架', slug: 'flash-support', rank:6)

c7 = Category.create(name: '机身附件', slug: 'camera-accessories')
c7.children.create(name: '遥控线控', slug: 'camera-remote', rank:1)
c7.children.create(name: '屏幕保护', slug: 'screen-protector', rank:2)
c7.children.create(name: '其他附件', slug: 'camera-other-accessories', rank:3)

c8 = Category.create(name: '镜头附件', slug: 'ens-accessories')
c8.children.create(name: '镜头盖/遮光罩', slug: 'lens-cap-hoods', rank:1)
c8.children.create(name: '微距附加镜', slug: 'additional-lenses', rank:2)
c8.children.create(name: '一般附件', slug: 'lens-other-accessories', rank:3)
c8.children.create(name: '镜头保护', slug: 'lens-protection', rank:4)

c9 = Category.create(name: '镜头滤镜', slug: 'lens-filters')
c9.children.create(name: 'UV/保护镜', slug: 'uv-filters', rank:1)
c9.children.create(name: 'ND减光镜', slug: 'nd-filters', rank:2)
c9.children.create(name: '特效滤镜', slug: 'special-filters', rank:3)
c9.children.create(name: '滤镜配件', slug: 'filter-accessories', rank:4)

c10 = Category.create(name: '存储设备', slug: 'cards-storage')
c10.children.create(name: '存储卡', slug: 'storage-cards', rank:1)
c10.children.create(name: '硬盘存储', slug: 'storage-harddrives', rank:2)
c10.children.create(name: '胶片', slug: 'film', rank:3)

c11 = Category.create(name: '电池电源', slug: 'batteries-power')
c11.children.create(name: '相机电池', slug: 'camera-batteries', rank:1)
c11.children.create(name: '电池手柄', slug: 'batter-grips', rank:2)
c11.children.create(name: '电源适配器', slug: 'charger', rank:3)
c11.children.create(name: '充电宝', slug: 'battery-pack', rank:4)


# Import brands
brands_csv = File.join(Rails.root, 'db', 'csv', 'brands.csv')
CSV.foreach(brands_csv) do |row|
  Brand.create name: row[0], en_name: row[1], slug: row[2]
end

