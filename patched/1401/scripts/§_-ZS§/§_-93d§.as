package §_-ZS§
{
   import §_-O24§.§_-l1D§;
   import §_-Ov§.§_-53f§;
   import §_-p2z§.§_-11m§;
   import §_-p2z§.§_-422§;
   import §_-p2z§.§_-61Y§;
   import §_-p2z§.§_-8o§;
   import §_-p2z§.§_-A3R§;
   import §_-p2z§.§_-A8§;
   import §_-p2z§.§_-C2J§;
   import §_-p2z§.§_-G2X§;
   import §_-p2z§.§_-IL§;
   import §_-p2z§.§_-O1l§;
   import §_-p2z§.§_-P2S§;
   import §_-p2z§.§_-R1V§;
   import §_-p2z§.§_-S2g§;
   import §_-p2z§.§_-Ui§;
   import §_-p2z§.§_-X0§;
   import §_-p2z§.§_-Y2Q§;
   import §_-p2z§.§_-gF§;
   import §_-p2z§.§_-nZ§;
   import §_-p2z§.§_-tP§;
   import §_-p2z§.§_-wZ§;
   import §_-p2z§.§_-y18§;
   import flash.display.Sprite;
   
   public class §_-93d§
   {
      
      public static const §_-w1g§:String = "dragonFire";
      
      public static const §_-nj§:String = "dormammuFire";
      
      public static const §_-MA§:String = "squirrelFire";
      
      public static const §_-C2M§:String = "squirrelFireBlue";
      
      public static const §_-811§:String = "fireBall";
      
      public static const §_-D1I§:String = "smoke";
      
      public static const §_-73k§:String = "yellowSmoke";
      
      public static const §_-Jk§:String = "blackSmoke";
      
      public static const §_-r2j§:String = "blueSmoke";
      
      public static const §_-pT§:String = "lightning";
      
      public static const §_-L15§:String = "lightningTail";
      
      public static const §_-R2v§:String = "planetGravity";
      
      public static const §_-g0§:String = "disintegrator";
      
      public static const §_-cA§:String = "missingNut";
      
      public static const §_-k2f§:String = "castShaman";
      
      public static const §_-92R§:String = "castFlowerShaman";
      
      public static const §_-k1d§:String = "zombieSmoke";
      
      public static const §_-k2s§:String = "zombieTransform";
      
      public static const §_-t2b§:String = "wildWayEffect";
      
      public static const §_-h11§:String = "volcanoInactive";
      
      public static const §_-13Q§:String = "volcanoPrepare";
      
      public static const §_-y2a§:String = "volcanoActive";
      
      public static const §_-U1F§:String = "sheepBomb";
      
      public static const §_-4m§:String = "shadowBomb";
      
      public static const §_-aZ§:String = "altroneFire";
      
      public static const §_-c15§:String = "fairyCat";
      
      public static const §_-81R§:String = "blackCat";
      
      public static const §_-s11§:String = "deer";
      
      public static const §_-WJ§:String = "timeWarp";
      
      public static const §_-Z11§:String = "vader";
      
      public static const §_-c1W§:String = "bearCoffee";
      
      public static const §_-dG§:String = "bearSwim";
      
      public static const §_-R2n§:String = "aidBridge";
      
      public static const §_-d2P§:String = "stitchLaser";
      
      public static const §_-51a§:String = "angelLaser";
      
      public static const §_-237§:String = "orc";
      
      public static const §_-p1C§:String = "goatMilk";
      
      public static const §_-C15§:String = "explosion";
      
      private static var _instance:§_-93d§ = null;
      
      private var §_-63k§:Number = 0;
      
      private var §_-C18§:Number = 0;
      
      private var §_-K1e§:Object = {
         "dragonFire":{
            "config":§_-Y2Q§.§_-o2t§,
            "image":new FireEffectParticle()
         },
         "dormammuFire":{
            "config":§_-Y2Q§.§_-Y8§,
            "image":new CircleEffectParticle()
         },
         "squirrelFire":{
            "config":§_-C2J§.§_-ir§,
            "image":new CircleEffectParticle()
         },
         "squirrelFireBlue":{
            "config":§_-C2J§.§_-P1C§,
            "image":new CircleEffectParticle()
         },
         "fireBall":{
            "config":§_-A3R§.§_-JD§,
            "image":new CircleEffectParticle()
         },
         "smoke":{
            "config":§_-S2g§.§_-81D§,
            "image":new SmokeEffect()
         },
         "blackSmoke":{
            "config":§_-S2g§.§_-U2B§,
            "image":new SmokeEffect()
         },
         "lightning":{
            "config":§_-G2X§.§_-810§,
            "image":new LightningEffectParticle()
         },
         "lightningTail":{
            "config":§_-G2X§.§_-p1P§,
            "image":new CircleEffectParticle()
         },
         "planetGravity":{
            "config":§_-8o§.§_-cl§,
            "image":new PlanetGravityEffect()
         },
         "disintegrator":{
            "config":§_-IL§.§_-82c§,
            "image":new DisintegratorEffect()
         },
         "missingNut":{
            "config":§_-R1V§.§_-o2c§,
            "image":new PlanetGravityEffect()
         },
         "castShaman":{
            "config":§_-O1l§.§_-Q5§,
            "image":new SphereEffectParticle()
         },
         "yellowSmoke":{
            "config":§_-S2g§.§_-9a§,
            "image":new SmokeEffect()
         },
         "blueSmoke":{
            "config":§_-S2g§.§_-y2t§,
            "image":new CircleEffectParticle()
         },
         "castFlowerShaman":{
            "config":§_-O1l§.§_-12L§,
            "image":new FlowerEffectParticle()
         },
         "zombieSmoke":{
            "config":§_-P2S§.§_-Hy§,
            "image":new ZombieSmokeEffect()
         },
         "zombieTransform":{
            "config":§_-422§.§_-21j§,
            "image":new ZombieTransformEffect()
         },
         "wildWayEffect":{
            "config":§_-X0§.§_-D2G§,
            "image":new WildWayEffect()
         },
         "volcanoInactive":{
            "config":§_-gF§.§_-6§,
            "image":new VolcanoSmokeEffect()
         },
         "volcanoPrepare":{
            "config":§_-gF§.§_-df§,
            "image":new VolcanoSmokeEffect()
         },
         "volcanoActive":{
            "config":§_-gF§.§_-S2N§,
            "image":new VolcanoHotEffect()
         },
         "sheepBomb":{
            "config":§_-S2g§.§_-cQ§,
            "image":new SmokeEffect()
         },
         "shadowBomb":{
            "config":§_-S2g§.§_-t2N§,
            "image":new SmokeEffect()
         },
         "altroneFire":{
            "config":§_-11m§.§_-T1e§,
            "image":new CircleEffectParticle()
         },
         "fairyCat":{
            "config":§_-11m§.§_-53b§,
            "image":new CircleEffectParticle()
         },
         "blackCat":{
            "config":§_-11m§.§_-zb§,
            "image":new CircleEffectParticle()
         },
         "deer":{
            "config":§_-11m§.§_-33W§,
            "image":new CircleEffectParticle()
         },
         "timeWarp":{
            "config":§_-A8§.§_-u2m§,
            "image":new CircleEffectParticle()
         },
         "vader":{
            "config":§_-wZ§.§_-Wv§,
            "image":new CircleEffectParticle()
         },
         "bearCoffee":{
            "config":§_-nZ§.§_-Zt§,
            "image":new CircleEffectParticle()
         },
         "bearSwim":{
            "config":§_-nZ§.§_-A28§,
            "image":new CircleEffectParticle()
         },
         "aidBridge":{
            "config":§_-61Y§.§_-n2c§,
            "image":new AidEffect()
         },
         "stitchLaser":{
            "config":§_-Ui§.§_-Zu§,
            "image":new CircleEffectParticle()
         },
         "angelLaser":{
            "config":§_-Ui§.§_-I18§,
            "image":new CircleEffectParticle()
         },
         "orc":{
            "config":§_-tP§.§_-pb§,
            "image":new CircleEffectParticle()
         },
         "goatMilk":{
            "config":§_-X0§.§_-31i§,
            "image":new CircleEffectParticle()
         },
         "castWolverineShaman":{
            "config":§_-O1l§.§_-12L§,
            "image":new FlowerEffectParticle()
         },
         "explosion":{
            "config":§_-y18§.§_-C15§,
            "image":new SphereEffectParticle()
         }
      };
      
      private var §_-520§:Vector.<§_-f1G§> = new Vector.<§_-f1G§>();
      
      public function §_-93d§()
      {
         super();
         §_-53f§.init(4096,false,4096,16);
      }
      
      public static function get instance() : §_-93d§
      {
         if(!_instance)
         {
            _instance = new §_-93d§();
         }
         return _instance;
      }
      
      public function set §_-dW§(param1:Number) : void
      {
         this.§_-63k§ = param1;
      }
      
      public function get §_-dW§() : Number
      {
         return this.§_-63k§;
      }
      
      public function set §_-d19§(param1:Number) : void
      {
         this.§_-C18§ = param1;
      }
      
      public function get §_-d19§() : Number
      {
         return this.§_-C18§;
      }
      
      public function §_-23j§(param1:String, param2:Object = null) : §_-f1G§
      {
         var _loc3_:* = null;
         if(this.§_-K1e§[param1].image is Sprite)
         {
            _loc3_ = §_-l1D§.instance.getTexture(this.§_-K1e§[param1].image);
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.§_-K1e§[param1].image;
         }
         var _loc4_:§_-f1G§ = new §_-f1G§(_loc3_,this.§_-K1e§[param1].config,this.§_-K1e§[param1].atlasXML,param2);
         this.§_-520§.push(_loc4_);
         return _loc4_;
      }
      
      public function §_-ms§(param1:§_-f1G§) : void
      {
         var _loc2_:Vector.<§_-f1G§> = null;
         if(this.§_-520§.indexOf(param1) > -1)
         {
            _loc2_ = this.§_-520§.splice(this.§_-520§.indexOf(param1),1);
            _loc2_[0].removeFromParent(true);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-520§.length)
         {
            this.§_-520§[_loc1_].removeFromParent(true);
            this.§_-520§[_loc1_] = null;
            _loc1_++;
         }
         this.§_-520§ = null;
      }
   }
}

