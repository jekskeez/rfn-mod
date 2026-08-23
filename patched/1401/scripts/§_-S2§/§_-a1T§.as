package §_-S2§
{
   import §_-1§.§_-K19§;
   import §_-1§.§_-tY§;
   import §_-92M§.§_-U1r§;
   import §_-C2a§.§_-W10§;
   import §_-C2a§.§_-ml§;
   import §_-EH§.§_-Z16§;
   import §_-I10§.§_-ct§;
   import §_-I10§.§_-g2W§;
   import §_-P2b§.§_-6L§;
   import §_-P2b§.§_-H2N§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-P1Y§;
   import §_-X1Q§.§_-O6§;
   import §_-Y29§.§_-nJ§;
   import §_-dc§.Clan;
   import §_-dc§.§_-V17§;
   import §_-dc§.§_-d1q§;
   import §_-jC§.§_-y2P§;
   import §_-rT§.§_-h1g§;
   import §_-vK§.§_-QC§;
   import §_-vK§.§_-SN§;
   import §_-vK§.§_-qC§;
   import §_-z2j§.§_-33U§;
   import §_-z2j§.§_-63h§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-a1T§
   {
      
      public var §_-s13§:Vector.<§_-K19§> = new Vector.<§_-K19§>();
      
      public var §_-03p§:Vector.<§_-V17§> = new Vector.<§_-V17§>();
      
      public var perksClothes:Vector.<§_-H2N§> = new Vector.<§_-H2N§>();
      
      public var §_-13j§:Vector.<§_-33U§> = new Vector.<§_-33U§>();
      
      public var §_-H2X§:Vector.<§_-W10§> = new Vector.<§_-W10§>();
      
      public var §_-515§:Vector.<§_-qC§> = new Vector.<§_-qC§>();
      
      private var hero:Hero;
      
      private var §_-n1D§:Object = {};
      
      private var §_-Z1b§:Object = {};
      
      private var §_-nc§:Boolean = false;
      
      private var §_-31g§:Boolean = false;
      
      private var §_-xK§:Object = {};
      
      private var §_-82V§:Object = {};
      
      public function §_-a1T§(param1:Hero)
      {
         super();
         this.hero = param1;
      }
      
      public function §_-e4§(param1:int) : int
      {
         if(param1 in this.§_-xK§)
         {
            return this.§_-xK§[param1];
         }
         return -1;
      }
      
      public function §_-g1D§(param1:int, param2:Array) : void
      {
         switch(param1)
         {
            case §_-g2W§.§_-k2t§:
               if(§_-q1p§.§_-Vz§.nonClothes || Boolean(§_-q1p§.§_-m15§[§_-92z§.mode]["nonClothes"]))
               {
                  return;
               }
               break;
            case §_-g2W§.§_-p2x§:
               if(§_-q1p§.§_-Vz§.nonHare || !§_-q1p§.§_-m15§[§_-92z§.mode]["hareButton"])
               {
                  return;
               }
               break;
            case §_-g2W§.§_-A2k§:
               if(!§_-q1p§.§_-m15§[§_-92z§.mode]["dragonButton"] && §_-92z§.mode != §_-q1p§.§_-SF§)
               {
                  return;
               }
               break;
            case §_-g2W§.§_-y1I§:
               if(§_-q1p§.§_-Vz§.nonItems || Boolean(§_-q1p§.§_-m15§[§_-92z§.mode]["nonShamanPerks"]))
               {
                  return;
               }
         }
         this.§_-n1D§[param1] = param2;
      }
      
      public function §_-su§(param1:int) : void
      {
         if(this.§_-Z1b§[param1])
         {
            return;
         }
         var _loc2_:Array = this.§_-n1D§[param1];
         if(!_loc2_)
         {
            if(!(§_-71o§.active is §_-P1Y§ && (param1 == §_-g2W§.§_-p2x§ || param1 == §_-g2W§.§_-A2k§)))
            {
               return;
            }
            _loc2_ = [];
         }
         this.§_-Z1b§[param1] = true;
         switch(param1)
         {
            case §_-g2W§.§_-k2t§:
               this.§_-N6§(_loc2_);
               break;
            case §_-g2W§.§_-p2x§:
               this.§_-X2V§(_loc2_);
               break;
            case §_-g2W§.§_-A2k§:
               this.§_-c25§(_loc2_);
               break;
            case §_-g2W§.§_-y1I§:
               this.§_-e1A§(_loc2_);
         }
      }
      
      public function §_-j22§() : void
      {
         var _loc2_:Class = null;
         var _loc3_:§_-K19§ = null;
         if(this.§_-nc§ || §_-q1p§.§_-Vz§.nonPerk && !(§_-71o§.active is §_-P1Y§) || this.§_-s13§.length > 0)
         {
            return;
         }
         if(!this.§_-s13§)
         {
            this.§_-s13§ = new Vector.<§_-K19§>();
         }
         var _loc1_:int = 0;
         while(_loc1_ < §_-tY§.§_-x1w§.length)
         {
            _loc2_ = §_-tY§.§_-xZ§(§_-tY§.§_-x1w§[_loc1_]);
            _loc3_ = new _loc2_(this.hero);
            _loc3_.§_-i2D§ = §_-tY§.§_-x1w§[_loc1_];
            this.§_-s13§.push(_loc3_);
            _loc1_++;
         }
         this.§_-nc§ = true;
         if(!this.hero.isSelf)
         {
            return;
         }
         §_-O6§.hero = this.hero;
      }
      
      public function §_-D1Z§() : void
      {
         if(this.§_-31g§ || !this.hero.isSelf)
         {
            return;
         }
         §_-U1r§.load();
         §_-U1r§.hero = this.hero;
         this.§_-31g§ = true;
      }
      
      public function §_-d5§(param1:Clan) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Class = null;
         var _loc5_:Boolean = false;
         var _loc6_:§_-V17§ = null;
         var _loc7_:§_-V17§ = null;
         var _loc2_:* = 0;
         while(_loc2_ < this.§_-03p§.length)
         {
            if(!param1.§_-G2I§.§_-c2g§(this.§_-03p§[_loc2_].id))
            {
               this.§_-03p§[_loc2_].dispose();
               this.§_-03p§.splice(_loc2_,1);
               _loc2_--;
            }
            _loc2_++;
         }
         for each(_loc3_ in param1.§_-G2I§.§_-y2y§)
         {
            _loc4_ = §_-d1q§.§_-xZ§(_loc3_["totem_id"]);
            if(_loc4_ != null)
            {
               _loc5_ = false;
               for each(_loc6_ in this.§_-03p§)
               {
                  if(_loc6_.id == _loc3_["totem_id"])
                  {
                     _loc5_ = true;
                  }
               }
               if(!_loc5_)
               {
                  _loc7_ = new _loc4_(this.hero,param1.totems.§_-p11§(_loc3_["totem_id"]));
                  this.§_-03p§.push(_loc7_);
               }
            }
         }
      }
      
      public function §_-S2A§() : void
      {
         var _loc1_:Perk = null;
         for each(_loc1_ in this.§_-s13§)
         {
            _loc1_.§_-S2A§();
         }
         for each(_loc1_ in this.perksClothes)
         {
            _loc1_.§_-S2A§();
         }
         for each(_loc1_ in this.§_-13j§)
         {
            _loc1_.§_-S2A§();
         }
         for each(_loc1_ in this.§_-H2X§)
         {
            _loc1_.§_-S2A§();
         }
         for each(_loc1_ in this.§_-515§)
         {
            _loc1_.§_-S2A§();
         }
      }
      
      public function §_-P1k§(param1:Number) : void
      {
         var _loc2_:Perk = null;
         var _loc3_:§_-V17§ = null;
         for each(_loc2_ in this.§_-s13§)
         {
            _loc2_.update(param1);
         }
         for each(_loc2_ in this.perksClothes)
         {
            _loc2_.update(param1);
         }
         for each(_loc2_ in this.§_-515§)
         {
            _loc2_.update(param1);
         }
         for each(_loc2_ in this.§_-13j§)
         {
            _loc2_.update(param1);
         }
         for each(_loc2_ in this.§_-H2X§)
         {
            _loc2_.update(param1);
         }
         for each(_loc3_ in this.§_-03p§)
         {
            _loc3_.update(param1);
         }
      }
      
      public function §_-vg§() : void
      {
         var _loc1_:§_-H2N§ = null;
         for each(_loc1_ in this.perksClothes)
         {
            if(_loc1_.active)
            {
               Connection.§_-Li§(§_-h2B§.§_-w1R§,_loc1_.§_-i2D§,§_-S2I§.§_-33T§,0,"");
            }
         }
      }
      
      public function §_-m2W§() : void
      {
         var _loc1_:§_-K19§ = null;
         for each(_loc1_ in this.§_-s13§)
         {
            if(_loc1_.active)
            {
               Connection.§_-Li§(§_-h2B§.§_-w1R§,_loc1_.§_-i2D§,§_-S2I§.§_-33T§,0,"");
            }
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:Perk = null;
         var _loc2_:§_-V17§ = null;
         for each(_loc1_ in this.§_-s13§)
         {
            _loc1_.dispose();
         }
         for each(_loc1_ in this.perksClothes)
         {
            _loc1_.dispose();
         }
         for each(_loc1_ in this.§_-13j§)
         {
            _loc1_.dispose();
         }
         for each(_loc1_ in this.§_-H2X§)
         {
            _loc1_.dispose();
         }
         for each(_loc1_ in this.§_-515§)
         {
            _loc1_.dispose();
         }
         for each(_loc2_ in this.§_-03p§)
         {
            _loc2_.dispose();
         }
         this.§_-s13§ = null;
         this.perksClothes = null;
         this.§_-13j§ = null;
         this.§_-H2X§ = null;
         this.§_-515§ = null;
         this.§_-03p§ = null;
         this.§_-n1D§ = {};
         this.§_-Z1b§ = {};
         this.§_-nc§ = false;
         this.§_-82V§ = {};
         this.§_-xK§ = {};
         if(!this.hero.isSelf)
         {
            return;
         }
         this.§_-31g§ = false;
         §_-O6§.hero = null;
         §_-y2P§.hero = null;
         §_-nJ§.hero = null;
         §_-h1g§.hero = null;
         §_-Z16§.hero = null;
         §_-U1r§.hero = null;
      }
      
      private function §_-N6§(param1:Array) : void
      {
         var _loc3_:Class = null;
         var _loc4_:§_-H2N§ = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = §_-6L§.§_-xZ§(param1[_loc2_]);
            if(_loc3_ != null)
            {
               _loc4_ = new _loc3_(this.hero);
               _loc4_.§_-j2Y§ = param1[_loc2_ + 1][0];
               _loc4_.§_-i2D§ = param1[_loc2_];
               this.perksClothes.push(_loc4_);
               this.§_-82V§[_loc4_.§_-i2D§] = _loc4_;
               this.§_-xK§[param1[_loc2_]] = _loc4_.§_-j2Y§;
            }
            _loc2_ += 2;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         §_-y2P§.hero = this.hero;
         §_-U1r§.hero = this.hero;
      }
      
      private function §_-X2V§(param1:Array) : void
      {
         var _loc3_:Class = null;
         var _loc4_:§_-33U§ = null;
         var _loc2_:int = §_-63h§.§_-Jq§;
         while(_loc2_ < §_-63h§.§_-I1l§)
         {
            _loc3_ = §_-63h§.§_-xZ§(_loc2_);
            _loc4_ = new _loc3_(this.hero);
            _loc4_.§_-i2D§ = _loc2_;
            this.§_-13j§.push(_loc4_);
            this.§_-82V§[_loc4_.§_-i2D§] = _loc4_;
            _loc2_++;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         §_-nJ§.hero = this.hero;
         §_-U1r§.hero = this.hero;
      }
      
      private function §_-c25§(param1:Array) : void
      {
         var _loc3_:Class = null;
         var _loc4_:§_-W10§ = null;
         var _loc2_:int = §_-ml§.§_-Jq§;
         while(_loc2_ < §_-ml§.§_-I1l§)
         {
            _loc3_ = §_-ml§.§_-xZ§(_loc2_);
            _loc4_ = new _loc3_(this.hero);
            _loc4_.§_-i2D§ = _loc2_;
            this.§_-H2X§.push(_loc4_);
            this.§_-82V§[_loc4_.§_-i2D§] = _loc4_;
            _loc2_++;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         §_-h1g§.hero = this.hero;
         §_-U1r§.hero = this.hero;
      }
      
      private function §_-e1A§(param1:Array) : void
      {
         var _loc3_:Class = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:§_-qC§ = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = §_-QC§.§_-xZ§(param1[_loc2_]);
            if(_loc3_ != null)
            {
               _loc4_ = int(param1[_loc2_ + 1][0]);
               _loc5_ = int(param1[_loc2_ + 1][1]);
               if(_loc4_ != 0)
               {
                  _loc6_ = §_-ct§.§_-w2d§(_loc4_,_loc5_);
                  _loc7_ = new _loc3_(this.hero,[_loc4_,_loc6_]);
                  _loc7_.§_-i2D§ = param1[_loc2_];
                  this.§_-515§.push(_loc7_);
                  this.§_-82V§[_loc7_.§_-i2D§] = _loc7_;
               }
            }
            _loc2_ += 2;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         if(§_-ct§.§_-m1k§ == 0)
         {
            _loc7_ = new §_-SN§(this.hero,[3,3]);
            this.§_-515§.push(_loc7_);
            this.§_-82V§[_loc7_.§_-i2D§] = _loc7_;
         }
         §_-Z16§.hero = this.hero;
         §_-U1r§.hero = this.hero;
      }
   }
}

