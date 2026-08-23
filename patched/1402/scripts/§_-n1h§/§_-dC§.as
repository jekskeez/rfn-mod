package §_-n1h§
{
   import §_-5P§.§_-H2l§;
   import §_-5P§.§_-Z1f§;
   import §_-HG§.§_-of§;
   import §_-Oc§.§_-WE§;
   import §_-Oc§.§_-u16§;
   import §_-P2Y§.§_-dn§;
   import §_-TN§.§_-cS§;
   import §_-U19§.Clan;
   import §_-U19§.§_-k2u§;
   import §_-U19§.§_-su§;
   import §_-X1g§.§_-M8§;
   import §_-X1g§.§_-s2y§;
   import §_-X1k§.§_-4v§;
   import §_-X1k§.§_-P2x§;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-g2C§.§_-A2Y§;
   import §_-j1y§.§_-Y3§;
   import §_-j2E§.§_-92f§;
   import §_-j2E§.§_-A11§;
   import §_-o10§.§_-O2z§;
   import §_-o10§.§_-p1B§;
   import §_-o10§.§_-pl§;
   import §_-vz§.§_-r20§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-dC§
   {
      
      public var §_-rI§:Vector.<§_-H2l§> = new Vector.<§_-H2l§>();
      
      public var §_-O1i§:Vector.<§_-k2u§> = new Vector.<§_-k2u§>();
      
      public var perksClothes:Vector.<§_-92f§> = new Vector.<§_-92f§>();
      
      public var §_-X1B§:Vector.<§_-WE§> = new Vector.<§_-WE§>();
      
      public var §_-N2R§:Vector.<§_-M8§> = new Vector.<§_-M8§>();
      
      public var §_-ov§:Vector.<§_-p1B§> = new Vector.<§_-p1B§>();
      
      private var hero:Hero;
      
      private var §_-d3§:Object = {};
      
      private var §_-x1a§:Object = {};
      
      private var §_-y1g§:Boolean = false;
      
      private var §_-73c§:Boolean = false;
      
      private var §_-Tl§:Object = {};
      
      private var §_-cd§:Object = {};
      
      public function §_-dC§(param1:Hero)
      {
         super();
         this.hero = param1;
      }
      
      public function §_-S1Q§(param1:int) : int
      {
         if(param1 in this.§_-Tl§)
         {
            return this.§_-Tl§[param1];
         }
         return -1;
      }
      
      public function §_-Zo§(param1:int, param2:Array) : void
      {
         switch(param1)
         {
            case §_-P2x§.§_-V1n§:
               if(§_-at§.§_-F2u§.nonClothes || Boolean(§_-at§.§_-02X§[§_-u24§.mode]["nonClothes"]))
               {
                  return;
               }
               break;
            case §_-P2x§.§_-M2M§:
               if(§_-at§.§_-F2u§.nonHare || !§_-at§.§_-02X§[§_-u24§.mode]["hareButton"])
               {
                  return;
               }
               break;
            case §_-P2x§.§_-JW§:
               if(!§_-at§.§_-02X§[§_-u24§.mode]["dragonButton"] && §_-u24§.mode != §_-at§.§_-R2V§)
               {
                  return;
               }
               break;
            case §_-P2x§.§_-qQ§:
               if(§_-at§.§_-F2u§.nonItems || Boolean(§_-at§.§_-02X§[§_-u24§.mode]["nonShamanPerks"]))
               {
                  return;
               }
         }
         this.§_-d3§[param1] = param2;
      }
      
      public function §_-N1x§(param1:int) : void
      {
         if(this.§_-x1a§[param1])
         {
            return;
         }
         var _loc2_:Array = this.§_-d3§[param1];
         if(!_loc2_)
         {
            if(!(§_-t2c§.active is §_-H1k§ && (param1 == §_-P2x§.§_-M2M§ || param1 == §_-P2x§.§_-JW§)))
            {
               return;
            }
            _loc2_ = [];
         }
         this.§_-x1a§[param1] = true;
         switch(param1)
         {
            case §_-P2x§.§_-V1n§:
               this.§_-t1Q§(_loc2_);
               break;
            case §_-P2x§.§_-M2M§:
               this.§_-n1G§(_loc2_);
               break;
            case §_-P2x§.§_-JW§:
               this.§_-21o§(_loc2_);
               break;
            case §_-P2x§.§_-qQ§:
               this.§_-kx§(_loc2_);
         }
      }
      
      public function §_-m2b§() : void
      {
         var _loc2_:Class = null;
         var _loc3_:§_-H2l§ = null;
         if(this.§_-y1g§ || §_-at§.§_-F2u§.nonPerk && !(§_-t2c§.active is §_-H1k§) || this.§_-rI§.length > 0)
         {
            return;
         }
         if(!this.§_-rI§)
         {
            this.§_-rI§ = new Vector.<§_-H2l§>();
         }
         var _loc1_:int = 0;
         while(_loc1_ < §_-Z1f§.§_-3P§.length)
         {
            _loc2_ = §_-Z1f§.§_-vW§(§_-Z1f§.§_-3P§[_loc1_]);
            _loc3_ = new _loc2_(this.hero);
            _loc3_.§_-T2a§ = §_-Z1f§.§_-3P§[_loc1_];
            this.§_-rI§.push(_loc3_);
            _loc1_++;
         }
         this.§_-y1g§ = true;
         if(!this.hero.isSelf)
         {
            return;
         }
         §_-dn§.hero = this.hero;
      }
      
      public function §_-qx§() : void
      {
         if(this.§_-73c§ || !this.hero.isSelf)
         {
            return;
         }
         §_-of§.load();
         §_-of§.hero = this.hero;
         this.§_-73c§ = true;
      }
      
      public function §_-E1t§(param1:Clan) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Class = null;
         var _loc5_:Boolean = false;
         var _loc6_:§_-k2u§ = null;
         var _loc7_:§_-k2u§ = null;
         var _loc2_:* = 0;
         while(_loc2_ < this.§_-O1i§.length)
         {
            if(!param1.§_-Af§.§_-h24§(this.§_-O1i§[_loc2_].id))
            {
               this.§_-O1i§[_loc2_].dispose();
               this.§_-O1i§.splice(_loc2_,1);
               _loc2_--;
            }
            _loc2_++;
         }
         for each(_loc3_ in param1.§_-Af§.§_-42P§)
         {
            _loc4_ = §_-su§.§_-vW§(_loc3_["totem_id"]);
            if(_loc4_ != null)
            {
               _loc5_ = false;
               for each(_loc6_ in this.§_-O1i§)
               {
                  if(_loc6_.id == _loc3_["totem_id"])
                  {
                     _loc5_ = true;
                  }
               }
               if(!_loc5_)
               {
                  _loc7_ = new _loc4_(this.hero,param1.totems.§_-Q15§(_loc3_["totem_id"]));
                  this.§_-O1i§.push(_loc7_);
               }
            }
         }
      }
      
      public function §_-xm§() : void
      {
         var _loc1_:Perk = null;
         for each(_loc1_ in this.§_-rI§)
         {
            _loc1_.§_-xm§();
         }
         for each(_loc1_ in this.perksClothes)
         {
            _loc1_.§_-xm§();
         }
         for each(_loc1_ in this.§_-X1B§)
         {
            _loc1_.§_-xm§();
         }
         for each(_loc1_ in this.§_-N2R§)
         {
            _loc1_.§_-xm§();
         }
         for each(_loc1_ in this.§_-ov§)
         {
            _loc1_.§_-xm§();
         }
      }
      
      public function §_-V2w§(param1:Number) : void
      {
         var _loc2_:Perk = null;
         var _loc3_:§_-k2u§ = null;
         for each(_loc2_ in this.§_-rI§)
         {
            _loc2_.update(param1);
         }
         for each(_loc2_ in this.perksClothes)
         {
            _loc2_.update(param1);
         }
         for each(_loc2_ in this.§_-ov§)
         {
            _loc2_.update(param1);
         }
         for each(_loc2_ in this.§_-X1B§)
         {
            _loc2_.update(param1);
         }
         for each(_loc2_ in this.§_-N2R§)
         {
            _loc2_.update(param1);
         }
         for each(_loc3_ in this.§_-O1i§)
         {
            _loc3_.update(param1);
         }
      }
      
      public function §_-F1U§() : void
      {
         var _loc1_:§_-92f§ = null;
         for each(_loc1_ in this.perksClothes)
         {
            if(_loc1_.active)
            {
               Connection.§_-e2T§(§_-u1O§.§_-C1i§,_loc1_.§_-T2a§,§_-s2l§.§_-31c§,0,"");
            }
         }
      }
      
      public function §_-2O§() : void
      {
         var _loc1_:§_-H2l§ = null;
         for each(_loc1_ in this.§_-rI§)
         {
            if(_loc1_.active)
            {
               Connection.§_-e2T§(§_-u1O§.§_-C1i§,_loc1_.§_-T2a§,§_-s2l§.§_-31c§,0,"");
            }
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:Perk = null;
         var _loc2_:§_-k2u§ = null;
         for each(_loc1_ in this.§_-rI§)
         {
            _loc1_.dispose();
         }
         for each(_loc1_ in this.perksClothes)
         {
            _loc1_.dispose();
         }
         for each(_loc1_ in this.§_-X1B§)
         {
            _loc1_.dispose();
         }
         for each(_loc1_ in this.§_-N2R§)
         {
            _loc1_.dispose();
         }
         for each(_loc1_ in this.§_-ov§)
         {
            _loc1_.dispose();
         }
         for each(_loc2_ in this.§_-O1i§)
         {
            _loc2_.dispose();
         }
         this.§_-rI§ = null;
         this.perksClothes = null;
         this.§_-X1B§ = null;
         this.§_-N2R§ = null;
         this.§_-ov§ = null;
         this.§_-O1i§ = null;
         this.§_-d3§ = {};
         this.§_-x1a§ = {};
         this.§_-y1g§ = false;
         this.§_-cd§ = {};
         this.§_-Tl§ = {};
         if(!this.hero.isSelf)
         {
            return;
         }
         this.§_-73c§ = false;
         §_-dn§.hero = null;
         §_-A2Y§.hero = null;
         §_-cS§.hero = null;
         §_-r20§.hero = null;
         §_-Y3§.hero = null;
         §_-of§.hero = null;
      }
      
      private function §_-t1Q§(param1:Array) : void
      {
         var _loc3_:Class = null;
         var _loc4_:§_-92f§ = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = §_-A11§.§_-vW§(param1[_loc2_]);
            if(_loc3_ != null)
            {
               _loc4_ = new _loc3_(this.hero);
               _loc4_.§_-32l§ = param1[_loc2_ + 1][0];
               _loc4_.§_-T2a§ = param1[_loc2_];
               this.perksClothes.push(_loc4_);
               this.§_-cd§[_loc4_.§_-T2a§] = _loc4_;
               this.§_-Tl§[param1[_loc2_]] = _loc4_.§_-32l§;
            }
            _loc2_ += 2;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         §_-A2Y§.hero = this.hero;
         §_-of§.hero = this.hero;
      }
      
      private function §_-n1G§(param1:Array) : void
      {
         var _loc3_:Class = null;
         var _loc4_:§_-WE§ = null;
         var _loc2_:int = §_-u16§.§_-WL§;
         while(_loc2_ < §_-u16§.§_-83P§)
         {
            _loc3_ = §_-u16§.§_-vW§(_loc2_);
            _loc4_ = new _loc3_(this.hero);
            _loc4_.§_-T2a§ = _loc2_;
            this.§_-X1B§.push(_loc4_);
            this.§_-cd§[_loc4_.§_-T2a§] = _loc4_;
            _loc2_++;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         §_-cS§.hero = this.hero;
         §_-of§.hero = this.hero;
      }
      
      private function §_-21o§(param1:Array) : void
      {
         var _loc3_:Class = null;
         var _loc4_:§_-M8§ = null;
         var _loc2_:int = §_-s2y§.§_-WL§;
         while(_loc2_ < §_-s2y§.§_-83P§)
         {
            _loc3_ = §_-s2y§.§_-vW§(_loc2_);
            _loc4_ = new _loc3_(this.hero);
            _loc4_.§_-T2a§ = _loc2_;
            this.§_-N2R§.push(_loc4_);
            this.§_-cd§[_loc4_.§_-T2a§] = _loc4_;
            _loc2_++;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         §_-r20§.hero = this.hero;
         §_-of§.hero = this.hero;
      }
      
      private function §_-kx§(param1:Array) : void
      {
         var _loc3_:Class = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:§_-p1B§ = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = §_-pl§.§_-vW§(param1[_loc2_]);
            if(_loc3_ != null)
            {
               _loc4_ = int(param1[_loc2_ + 1][0]);
               _loc5_ = int(param1[_loc2_ + 1][1]);
               if(_loc4_ != 0)
               {
                  _loc6_ = §_-4v§.§_-R2G§(_loc4_,_loc5_);
                  _loc7_ = new _loc3_(this.hero,[_loc4_,_loc6_]);
                  _loc7_.§_-T2a§ = param1[_loc2_];
                  this.§_-ov§.push(_loc7_);
                  this.§_-cd§[_loc7_.§_-T2a§] = _loc7_;
               }
            }
            _loc2_ += 2;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         if(§_-4v§.§_-71M§ == 0)
         {
            _loc7_ = new §_-O2z§(this.hero,[3,3]);
            this.§_-ov§.push(_loc7_);
            this.§_-cd§[_loc7_.§_-T2a§] = _loc7_;
         }
         §_-Y3§.hero = this.hero;
         §_-of§.hero = this.hero;
      }
   }
}

