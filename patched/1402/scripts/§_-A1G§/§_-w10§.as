package §_-A1G§
{
   import §_-B37§.§_-Y7§;
   import §_-b2F§.§_-iC§;
   import §_-eR§.§_-03i§;
   import §_-eR§.§_-728§;
   import §_-eR§.§_-A5§;
   import §_-eR§.§_-C27§;
   import §_-eR§.§_-F1M§;
   import §_-eR§.§_-G2G§;
   import §_-eR§.§_-K1c§;
   import §_-eR§.§_-K23§;
   import §_-eR§.§_-L2T§;
   import §_-eR§.§_-Q2a§;
   import §_-eR§.§_-S2n§;
   import §_-eR§.§_-Uw§;
   import §_-eR§.§_-V22§;
   import §_-eR§.§_-V2N§;
   import §_-eR§.§_-V2Q§;
   import §_-eR§.§_-YM§;
   import §_-eR§.§_-j1§;
   import §_-eR§.§_-m1w§;
   import §_-eR§.§_-q2v§;
   import §_-eR§.§_-v1Q§;
   import §_-eR§.§_-v2I§;
   import flash.display.Sprite;
   
   public class §_-w10§
   {
      
      public static const §_-xG§:String = "dragonFire";
      
      public static const §_-Pc§:String = "dormammuFire";
      
      public static const §_-e2i§:String = "squirrelFire";
      
      public static const §_-h2G§:String = "squirrelFireBlue";
      
      public static const §_-g4§:String = "fireBall";
      
      public static const §_-p1a§:String = "smoke";
      
      public static const §_-XK§:String = "yellowSmoke";
      
      public static const §_-eB§:String = "blackSmoke";
      
      public static const §_-1f§:String = "blueSmoke";
      
      public static const §_-X1N§:String = "lightning";
      
      public static const §_-l1f§:String = "lightningTail";
      
      public static const §_-i1k§:String = "planetGravity";
      
      public static const §_-I2g§:String = "disintegrator";
      
      public static const §_-D1W§:String = "missingNut";
      
      public static const §_-32§:String = "castShaman";
      
      public static const §_-cW§:String = "castFlowerShaman";
      
      public static const §_-PW§:String = "zombieSmoke";
      
      public static const §_-A2o§:String = "zombieTransform";
      
      public static const §_-f2E§:String = "wildWayEffect";
      
      public static const §_-j2R§:String = "volcanoInactive";
      
      public static const §_-62h§:String = "volcanoPrepare";
      
      public static const §_-y2d§:String = "volcanoActive";
      
      public static const §_-i2L§:String = "sheepBomb";
      
      public static const §_-H2I§:String = "shadowBomb";
      
      public static const §_-F21§:String = "altroneFire";
      
      public static const §_-Cl§:String = "fairyCat";
      
      public static const §_-Fe§:String = "blackCat";
      
      public static const §_-k1Y§:String = "deer";
      
      public static const §_-21q§:String = "timeWarp";
      
      public static const §_-A1N§:String = "vader";
      
      public static const §_-u2i§:String = "bearCoffee";
      
      public static const §_-92K§:String = "bearSwim";
      
      public static const §_-m2z§:String = "aidBridge";
      
      public static const §_-r1R§:String = "stitchLaser";
      
      public static const §_-Qc§:String = "angelLaser";
      
      public static const §_-51i§:String = "orc";
      
      public static const §_-bi§:String = "goatMilk";
      
      public static const §_-s3§:String = "explosion";
      
      private static var _instance:§_-w10§ = null;
      
      private var §_-i1Q§:Number = 0;
      
      private var §_-42Q§:Number = 0;
      
      private var §_-72K§:Object = {
         "dragonFire":{
            "config":§_-V2N§.§_-F1I§,
            "image":new FireEffectParticle()
         },
         "dormammuFire":{
            "config":§_-V2N§.§_-33V§,
            "image":new CircleEffectParticle()
         },
         "squirrelFire":{
            "config":§_-F1M§.§_-CJ§,
            "image":new CircleEffectParticle()
         },
         "squirrelFireBlue":{
            "config":§_-F1M§.§_-Lu§,
            "image":new CircleEffectParticle()
         },
         "fireBall":{
            "config":§_-V2Q§.§_-C3J§,
            "image":new CircleEffectParticle()
         },
         "smoke":{
            "config":§_-03i§.§_-I11§,
            "image":new SmokeEffect()
         },
         "blackSmoke":{
            "config":§_-03i§.§_-eF§,
            "image":new SmokeEffect()
         },
         "lightning":{
            "config":§_-YM§.§_-FG§,
            "image":new LightningEffectParticle()
         },
         "lightningTail":{
            "config":§_-YM§.§_-Z2z§,
            "image":new CircleEffectParticle()
         },
         "planetGravity":{
            "config":§_-j1§.§_-81U§,
            "image":new PlanetGravityEffect()
         },
         "disintegrator":{
            "config":§_-L2T§.§_-82a§,
            "image":new DisintegratorEffect()
         },
         "missingNut":{
            "config":§_-C27§.§_-F2a§,
            "image":new PlanetGravityEffect()
         },
         "castShaman":{
            "config":§_-G2G§.§_-eu§,
            "image":new SphereEffectParticle()
         },
         "yellowSmoke":{
            "config":§_-03i§.§_-229§,
            "image":new SmokeEffect()
         },
         "blueSmoke":{
            "config":§_-03i§.§_-82b§,
            "image":new CircleEffectParticle()
         },
         "castFlowerShaman":{
            "config":§_-G2G§.§_-8w§,
            "image":new FlowerEffectParticle()
         },
         "zombieSmoke":{
            "config":§_-K1c§.§_-p9§,
            "image":new ZombieSmokeEffect()
         },
         "zombieTransform":{
            "config":§_-728§.§_-v1h§,
            "image":new ZombieTransformEffect()
         },
         "wildWayEffect":{
            "config":§_-A5§.§_-Q29§,
            "image":new WildWayEffect()
         },
         "volcanoInactive":{
            "config":§_-m1w§.§_-2f§,
            "image":new VolcanoSmokeEffect()
         },
         "volcanoPrepare":{
            "config":§_-m1w§.§_-O3§,
            "image":new VolcanoSmokeEffect()
         },
         "volcanoActive":{
            "config":§_-m1w§.§_-D2H§,
            "image":new VolcanoHotEffect()
         },
         "sheepBomb":{
            "config":§_-03i§.§_-r2C§,
            "image":new SmokeEffect()
         },
         "shadowBomb":{
            "config":§_-03i§.§_-N2§,
            "image":new SmokeEffect()
         },
         "altroneFire":{
            "config":§_-V22§.§_-813§,
            "image":new CircleEffectParticle()
         },
         "fairyCat":{
            "config":§_-V22§.§_-X4§,
            "image":new CircleEffectParticle()
         },
         "blackCat":{
            "config":§_-V22§.§_-H1K§,
            "image":new CircleEffectParticle()
         },
         "deer":{
            "config":§_-V22§.§_-3L§,
            "image":new CircleEffectParticle()
         },
         "timeWarp":{
            "config":§_-Q2a§.§_-H20§,
            "image":new CircleEffectParticle()
         },
         "vader":{
            "config":§_-q2v§.§_-72Z§,
            "image":new CircleEffectParticle()
         },
         "bearCoffee":{
            "config":§_-v2I§.§_-53s§,
            "image":new CircleEffectParticle()
         },
         "bearSwim":{
            "config":§_-v2I§.§_-71§,
            "image":new CircleEffectParticle()
         },
         "aidBridge":{
            "config":§_-S2n§.§_-S2G§,
            "image":new AidEffect()
         },
         "stitchLaser":{
            "config":§_-K23§.§_-n18§,
            "image":new CircleEffectParticle()
         },
         "angelLaser":{
            "config":§_-K23§.§_-C2j§,
            "image":new CircleEffectParticle()
         },
         "orc":{
            "config":§_-Uw§.§_-93P§,
            "image":new CircleEffectParticle()
         },
         "goatMilk":{
            "config":§_-A5§.§_-o1Y§,
            "image":new CircleEffectParticle()
         },
         "castWolverineShaman":{
            "config":§_-G2G§.§_-8w§,
            "image":new FlowerEffectParticle()
         },
         "explosion":{
            "config":§_-v1Q§.§_-s3§,
            "image":new SphereEffectParticle()
         }
      };
      
      private var §_-c2y§:Vector.<§_-11u§> = new Vector.<§_-11u§>();
      
      public function §_-w10§()
      {
         super();
         §_-iC§.init(4096,false,4096,16);
      }
      
      public static function get instance() : §_-w10§
      {
         if(!_instance)
         {
            _instance = new §_-w10§();
         }
         return _instance;
      }
      
      public function set §_-v2n§(param1:Number) : void
      {
         this.§_-i1Q§ = param1;
      }
      
      public function get §_-v2n§() : Number
      {
         return this.§_-i1Q§;
      }
      
      public function set §_-E2j§(param1:Number) : void
      {
         this.§_-42Q§ = param1;
      }
      
      public function get §_-E2j§() : Number
      {
         return this.§_-42Q§;
      }
      
      public function §_-d1y§(param1:String, param2:Object = null) : §_-11u§
      {
         var _loc3_:* = null;
         if(this.§_-72K§[param1].image is Sprite)
         {
            _loc3_ = §_-Y7§.instance.getTexture(this.§_-72K§[param1].image);
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.§_-72K§[param1].image;
         }
         var _loc4_:§_-11u§ = new §_-11u§(_loc3_,this.§_-72K§[param1].config,this.§_-72K§[param1].atlasXML,param2);
         this.§_-c2y§.push(_loc4_);
         return _loc4_;
      }
      
      public function §_-L1c§(param1:§_-11u§) : void
      {
         var _loc2_:Vector.<§_-11u§> = null;
         if(this.§_-c2y§.indexOf(param1) > -1)
         {
            _loc2_ = this.§_-c2y§.splice(this.§_-c2y§.indexOf(param1),1);
            _loc2_[0].removeFromParent(true);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-c2y§.length)
         {
            this.§_-c2y§[_loc1_].removeFromParent(true);
            this.§_-c2y§[_loc1_] = null;
            _loc1_++;
         }
         this.§_-c2y§ = null;
      }
   }
}

