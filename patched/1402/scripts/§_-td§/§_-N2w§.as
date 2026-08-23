package §_-td§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-61C§.§_-a2p§;
   import §_-8Q§.§_-u1i§;
   import §_-G2y§.ControllerHeroLocal;
   import §_-G2y§.ControllerHeroRemote;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-4v§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-OG§;
   import §_-X1k§.§_-hO§;
   import §_-X2V§.SquirrelEvent;
   import §_-X2V§.SquirrelGameEvent;
   import §_-c2C§.§_-u24§;
   import §_-q0§.§_-gr§;
   import chat.§_-O1y§;
   import chat.§_-g1j§;
   import events.GameEvent;
   import flash.display.Bitmap;
   import flash.display.BlendMode;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-u1J§;
   import game.mainGame.§_-w23§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-33I§;
   import utils.§_-O1T§;
   import utils.§_-Zc§;
   import utils.§_-o1Q§;
   
   public class §_-N2w§ extends SquirrelCollection
   {
      
      private static var _instance:§_-N2w§;
      
      public var locationId:int = -1;
      
      public var §_-n2G§:int = 0;
      
      public var respawn:int = 0;
      
      public var §_-W2y§:int = 0;
      
      protected var §_-M2K§:Array = [];
      
      protected var §_-h2b§:Object = {};
      
      private var §_-22j§:uint = 0;
      
      private var §_-o1B§:uint = 0;
      
      private var §_-D1v§:uint = 0;
      
      private var §_-5f§:uint = 0;
      
      private var §_-I2O§:Array = [];
      
      private var §_-b1H§:Array = [];
      
      private var §_-81b§:§_-u1J§ = null;
      
      private var §_-A3R§:Object = {};
      
      private var §_-G2n§:Array;
      
      private var §_-w2A§:§_-w23§ = null;
      
      private var §_-gZ§:Boolean = false;
      
      private var §_-32C§:§_-gr§ = null;
      
      public function §_-N2w§()
      {
         _instance = this;
         super();
         §_-R2o§();
         this.§_-h2Y§.start();
         var _loc1_:ShamanDead = new ShamanDead();
         var _loc2_:Bitmap = §_-O1T§.§_-oM§(_loc1_,_loc1_.width,_loc1_.height);
         _loc2_.smoothing = true;
         _loc2_.blendMode = BlendMode.SCREEN;
         this.§_-81b§ = new §_-u1J§(_loc2_,20);
         this.§_-81b§.addEventListener("Finished",this.§_-61Y§);
         this.mouseChildren = true;
         this.mouseEnabled = true;
         this.§_-w2A§ = new §_-w23§();
         this.§_-w2A§.addEventListener(MouseEvent.CLICK,this.§_-UE§);
         this.§_-32C§ = new §_-gr§(§_-kG§.§_-E1U§);
         §_-LZ§.addEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-On§);
         §_-hO§.addEventListener(GameEvent.MANA_CHANGED,this.§_-o2X§);
         §_-hO§.addEventListener(GameEvent.ENERGY_CHANGED,this.§_-dL§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-o2Z§,§_-s2l§.§_-V1b§,§_-s2l§.§_-VB§,§_-s2l§.§_-Yi§,§_-s2l§.§_-6b§,§_-s2l§.§_-D2o§,§_-s2l§.§_-n1f§,§_-s2l§.§_-43Q§,§_-s2l§.§_-V2o§,§_-s2l§.§_-v1r§,§_-s2l§.§_-1q§,§_-s2l§.§_-N1Y§,§_-s2l§.§_-kF§,§_-s2l§.§_-K1j§,§_-s2l§.§_-QS§,§_-s2l§.§_-ma§,§_-s2l§.§_-g2p§],1);
      }
      
      public static function get §_-rl§() : int
      {
         return _instance ? _instance.§_-n2G§ : 0;
      }
      
      public static function get §_-T19§() : int
      {
         return _instance ? _instance.§_-72r§ : 0;
      }
      
      public static function get §_-ZF§() : int
      {
         return _instance ? _instance.§_-e1T§ : 0;
      }
      
      public static function get §_-M1P§() : int
      {
         return _instance ? _instance.§_-V3§ : 0;
      }
      
      public static function get §_-xJ§() : int
      {
         return _instance ? int(_instance.§_-z1M§) : 0;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-32C§)
         {
            this.§_-32C§.update(param1);
         }
      }
      
      override public function round(param1:Array) : void
      {
         switch(param1[0])
         {
            case §_-s2l§.ROUND_STARTING:
               this.§_-w2A§.visible = false;
               this.§_-M2K§ = [];
               this.§_-I2O§ = [];
               this.§_-b1H§ = [];
               this.§_-h2b§ = {};
            case §_-s2l§.ROUND_WAITING:
            case §_-s2l§.ROUND_PLAYING:
            case §_-s2l§.§_-02x§:
               hide();
               break;
            case §_-s2l§.ROUND_START:
               if(§_-u24§.§_-j2T§ == 0)
               {
                  ControllerHeroLocal.§_-T16§ = false;
               }
               this.§_-A3R§ = {};
               this.§_-w2A§.visible = false;
               this.§_-gZ§ = false;
               this.§_-w2A§.reset();
               this.§_-n2G§ = 0;
               this.§_-W2y§ = 0;
               this.respawn = 0;
               this.§_-o1w§ = false;
               §_-a2p§.§_-N2j§ = false;
               reset();
               this.§_-uK§();
               this.§_-g5§();
               place();
               show();
               §_-a2p§.§_-N2j§ = true;
               this.§_-72r§ = 0;
               this.§_-e1T§ = 0;
               this.§_-V3§ = 0;
               this.§_-z1M§ = 0;
         }
      }
      
      override public function §_-I26§(param1:Boolean = true) : void
      {
         this.§_-G2n§ = super.§_-qb§();
         if(this.§_-G2n§.length == 1 && this.§_-G2n§[0].id != Game.selfId && !this.§_-gZ§)
         {
            this.§_-w2A§.visible = true;
            this.§_-G2n§[0].addViewButton(this.§_-w2A§);
         }
         else if(param1)
         {
            if(this.§_-gZ§)
            {
               §_-u24§.§_-bP§();
               this.§_-gZ§ = false;
            }
            this.§_-w2A§.visible = false;
         }
      }
      
      override public function §_-01a§(param1:int, param2:int) : Boolean
      {
         if(param2 in this.§_-A3R§)
         {
            return false;
         }
         if(§_-Iq§(param1,param2))
         {
            return false;
         }
         this.§_-A3R§[param2] = true;
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"GumWith":[param1,param2]}));
         return true;
      }
      
      override public function §_-wt§() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-M2K§)
         {
            if(get(_loc2_) != null)
            {
               _loc1_.push(get(_loc2_));
            }
         }
         return _loc1_;
      }
      
      override public function §_-J1N§(param1:Array, param2:Boolean = true) : void
      {
         this.§_-b1s§();
         super.§_-J1N§(param1,param2);
      }
      
      override public function add(param1:int) : void
      {
         super.add(param1);
         if(param1 != Game.selfId)
         {
            return;
         }
         this.§_-g5§();
         §_-a2p§.hero = Hero.self;
      }
      
      override public function remove(param1:int) : void
      {
         super.remove(param1);
         if(this.count > 1 || !GameMap.instance)
         {
            return;
         }
         (GameMap.instance as GameMapNet).§_-u1m§.§_-Ca§ = false;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _instance = null;
         if(this.§_-81b§)
         {
            this.§_-81b§.removeEventListener("Finished",this.§_-61Y§);
            this.§_-61Y§();
            this.§_-81b§ = null;
         }
         if(this.§_-32C§)
         {
            this.§_-32C§.dispose();
            this.§_-32C§ = null;
         }
         §_-a2p§.hero = null;
         §_-hO§.removeEventListener(GameEvent.MANA_CHANGED,this.§_-o2X§);
         §_-hO§.removeEventListener(GameEvent.ENERGY_CHANGED,this.§_-dL§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-o2Z§,§_-s2l§.§_-V1b§,§_-s2l§.§_-VB§,§_-s2l§.§_-Yi§,§_-s2l§.§_-6b§,§_-s2l§.§_-D2o§,§_-s2l§.§_-n1f§,§_-s2l§.§_-43Q§,§_-s2l§.§_-V2o§,§_-s2l§.§_-v1r§,§_-s2l§.§_-1q§,§_-s2l§.§_-N1Y§,§_-s2l§.§_-kF§,§_-s2l§.§_-K1j§,§_-s2l§.§_-QS§,§_-s2l§.§_-ma§,§_-s2l§.§_-g2p§]);
      }
      
      public function get §_-e1T§() : int
      {
         return this.§_-o1B§;
      }
      
      public function set §_-e1T§(param1:int) : void
      {
         this.§_-o1B§ = param1;
         dispatchEvent(new SquirrelGameEvent(SquirrelGameEvent.UPDATE_BONUS));
      }
      
      public function get §_-V3§() : int
      {
         return this.§_-D1v§;
      }
      
      public function set §_-V3§(param1:int) : void
      {
         this.§_-D1v§ = param1;
         dispatchEvent(new SquirrelGameEvent(SquirrelGameEvent.UPDATE_BONUS));
      }
      
      public function get §_-z1M§() : uint
      {
         return this.§_-5f§;
      }
      
      public function set §_-z1M§(param1:uint) : void
      {
         this.§_-5f§ = param1;
         dispatchEvent(new SquirrelGameEvent(SquirrelGameEvent.UPDATE_BONUS));
      }
      
      public function get §_-72r§() : int
      {
         return this.§_-22j§;
      }
      
      public function set §_-72r§(param1:int) : void
      {
         this.§_-22j§ = param1;
         dispatchEvent(new SquirrelGameEvent(SquirrelGameEvent.UPDATE_BONUS));
      }
      
      override protected function §_-43r§(param1:SquirrelEvent = null) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-v1r§,Hero.self.position.x,Hero.self.position.y,Hero.self.§_-b2d§);
      }
      
      override protected function §_-21b§(param1:int) : void
      {
         if(param1 <= 0)
         {
            return;
         }
         if(param1 == Game.selfId)
         {
            new ControllerHeroLocal(this.players[param1],true);
         }
         else
         {
            new ControllerHeroRemote(this.players[param1],param1);
         }
      }
      
      protected function §_-g5§() : void
      {
         if(!Hero.self)
         {
            return;
         }
         Hero.self.§_-h1z§.§_-J2m§(§_-Zc§.§_-aq§(§_-OG§.items));
      }
      
      protected function §_-uK§() : void
      {
         this.§_-J1N§(this.§_-M2K§);
         §_-Jg§(this.§_-I2O§);
         §_-8r§(this.§_-b1H§);
      }
      
      protected function §_-b1s§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:String = null;
         for each(_loc1_ in this.players)
         {
            _loc1_.team = Hero.§_-PM§;
         }
         for(_loc2_ in this.§_-h2b§)
         {
            _loc1_ = get(int(_loc2_));
            if(_loc1_)
            {
               _loc1_.team = this.§_-h2b§[_loc2_];
            }
         }
      }
      
      protected function §_-U1z§() : void
      {
         var _loc1_:int = 0;
         if(Boolean(this.§_-M2K§) && Boolean(this.§_-M2K§.length > 0) && Boolean(get(this.§_-M2K§[0])))
         {
            §_-p1V§.§_-A3z§(this.§_-i2d§);
            if(get(this.§_-M2K§[0]).id != Game.selfId)
            {
               _loc1_ = Math.random() * §_-RH§.§_-F2L§.length;
               GameSounds.playUnrepeatable(§_-RH§.§_-F2L§[_loc1_]);
            }
            if(!contains(this.§_-81b§))
            {
               this.§_-81b§.setPosition(get(this.§_-M2K§[0]).x + 30,get(this.§_-M2K§[0]).y - 40);
               addChild(this.§_-81b§);
            }
         }
      }
      
      protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Hero = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:Hero = null;
         var _loc11_:Object = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:uint = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:Object = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:Array = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         switch(param1.type)
         {
            case §_-s2l§.§_-o2Z§:
               set(param1[2]);
               this.add(Game.selfId);
               hide();
               break;
            case §_-s2l§.§_-V1b§:
               _loc2_ = int(param1[0]);
               _loc3_ = get(_loc2_);
               if(!_loc3_)
               {
                  return;
               }
               _loc6_ = _loc3_.§_-23m§;
               _loc3_.dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-M15§,_loc3_));
               this.remove(_loc2_);
               if(!_loc6_)
               {
                  this.§_-I26§(false);
               }
               break;
            case §_-s2l§.§_-VB§:
               §_-71g§(param1[0]);
               break;
            case §_-s2l§.§_-Yi§:
               this.§_-U1z§();
               this.§_-M2K§ = param1[0];
               this.§_-h2b§ = {};
               _loc7_ = int(this.§_-M2K§.length);
               _loc20_ = 0;
               while(_loc20_ < _loc7_)
               {
                  this.§_-h2b§[this.§_-M2K§[_loc20_]] = param1[1][_loc20_];
                  _loc20_++;
               }
               this.§_-J1N§(this.§_-M2K§,false);
               for each(_loc21_ in this.§_-M2K§)
               {
                  if(_loc21_)
                  {
                     §_-u24§.sendMessage(_loc21_,"",§_-g1j§.§_-Z2N§);
                  }
               }
               this.§_-I26§();
               break;
            case §_-s2l§.§_-6b§:
               _loc8_ = param1[0];
               _loc9_ = int(_loc8_.length);
               _loc20_ = 0;
               while(_loc20_ < _loc9_)
               {
                  switch(_loc8_[_loc20_])
                  {
                     case §_-s2l§.§_-611§:
                        this.§_-b1H§ = _loc8_[_loc20_ + 1];
                        §_-8r§(this.§_-b1H§);
                        break;
                     case §_-s2l§.§_-P1S§:
                        this.§_-I2O§ = _loc8_[_loc20_ + 1];
                        §_-Jg§(this.§_-I2O§);
                  }
                  _loc20_ += 2;
               }
               break;
            case §_-s2l§.§_-D2o§:
               _loc3_ = get(param1[0]);
               if(!_loc3_)
               {
                  return;
               }
               _loc3_.§_-I1u§(param1[1] == §_-u1O§.§_-A1F§ ? Hero.§_-43e§ : Hero.§_-z2T§);
               break;
            case §_-s2l§.§_-n1f§:
               if(param1[0] == 1)
               {
                  return;
               }
               _loc2_ = int(param1[1]);
               _loc3_ = get(_loc2_);
               if(Boolean(_loc3_) && !_loc3_.isSelf)
               {
                  _loc3_.onHollow(param1[2]);
               }
               if(Hero.self)
               {
                  ControllerHeroLocal.§_-T16§ = !Hero.self.isHare;
                  if(Hero.self.isHare && !this.§_-Un§(false))
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-A1F§);
                     Connection.§_-e2T§(§_-u1O§.§_-n1f§,0);
                  }
               }
               if(_loc2_ == Game.selfId && this.locationId == §_-at§.§_-B2t§ && this.§_-Un§(false))
               {
                  §_-u24§.§_-Wg§();
               }
               this.§_-I26§();
               break;
            case §_-s2l§.§_-43Q§:
               this.§_-P2§(param1[0],param1[1]);
               break;
            case §_-s2l§.§_-V2o§:
               _loc2_ = int(param1[0]);
               this.add(_loc2_);
               if(param1[1] == §_-s2l§.§_-r1v§)
               {
                  get(_loc2_).hide();
               }
               if(Boolean(Hero.self) && (Hero.self.position.x != 0 && Hero.self.position.y != 0))
               {
                  Hero.self.sendLocation();
               }
               break;
            case §_-s2l§.§_-v1r§:
               this.§_-I26§();
               _loc2_ = int(param1[0]);
               if(_loc2_ == Game.selfId)
               {
                  break;
               }
               _loc3_ = get(_loc2_);
               if(!_loc3_)
               {
                  return;
               }
               _loc3_.position = new b2Vec2(param1[1],param1[2]);
               _loc3_.§_-b2d§ = param1[3];
               _loc3_.dead = true;
               if(_loc3_.isHare)
               {
                  GameSounds.play(§_-RH§.§_-V2c§[int(Math.random() * §_-RH§.§_-V2c§.length)]);
               }
               if(Boolean(Hero.self) && Boolean(!this.§_-Un§(false)) && Hero.self.isHare)
               {
                  _loc3_.§_-b2d§ = Hero.§_-41§;
                  _loc3_.dead = true;
                  break;
               }
               this.§_-I26§();
               _loc10_ = this.get(this.§_-I2O§[0]);
               if(Boolean(!_loc3_.isHare && this.§_-I2O§.length > 0) && Boolean(_loc10_) && !_loc10_.isDead)
               {
                  GameSounds.playUnrepeatable("hare_killer",§_-23o§.§_-Q0§);
               }
               break;
            case §_-s2l§.§_-1q§:
               _loc11_ = param1[1];
               if("GumWith" in _loc11_)
               {
                  _loc22_ = _loc11_["GumWith"];
                  _loc23_ = int(_loc22_[0]);
                  _loc24_ = int(_loc22_[1]);
                  if(_loc23_ == Game.selfId)
                  {
                     delete this.§_-A3R§[_loc24_];
                  }
                  super.§_-01a§(_loc23_,_loc24_);
               }
               break;
            case §_-s2l§.§_-N1Y§:
               _loc12_ = int(param1[0]);
               _loc2_ = int(param1[1]);
               _loc3_ = get(_loc2_);
               if(!_loc3_)
               {
                  return;
               }
               if(!_loc3_.isDead || _loc12_ == §_-s2l§.§_-Y2§)
               {
                  break;
               }
               _loc4_ = int(param1[2]);
               switch(_loc4_)
               {
                  case §_-s2l§.§_-C2D§:
                     _loc3_.teleport(Hero.§_-L1F§);
                     break;
                  case §_-s2l§.§_-m21§:
                     break;
                  default:
                     _loc5_ = _loc2_ == Game.selfId;
                     if(_loc5_ && _loc4_ == §_-s2l§.§_-c1a§)
                     {
                        ++this.§_-n2G§;
                     }
                     if(_loc5_ && _loc4_ == §_-s2l§.§_-31a§)
                     {
                        ++this.§_-W2y§;
                     }
                     ++this.respawn;
                     _loc3_.shaman = false;
                     _loc3_.teleport(Hero.§_-E2Y§);
                     setTimeout(this.§_-r1Q§,0,_loc3_);
               }
               break;
            case §_-s2l§.§_-kF§:
               _loc2_ = int(param1[0]);
               if(!_loc2_)
               {
                  break;
               }
               _loc13_ = int(param1[1]);
               _loc14_ = int(param1[2]);
               _loc5_ = _loc2_ == Game.selfId;
               if(_loc5_)
               {
                  this.§_-o1w§ = true;
               }
               if(_loc5_ && !§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§))
               {
                  break;
               }
               _loc15_ = _loc13_ == §_-u1i§.§_-13j§ ? §_-42H§.§_-U13§[_loc14_]["tittle"] : "";
               §_-u24§.sendMessage(_loc2_,_loc15_,§_-g1j§.§_-K2D§);
               break;
            case §_-s2l§.§_-K1j§:
               _loc16_ = int(param1[1]);
               _loc4_ = int(param1[2]);
               if(_loc4_ != §_-s2l§.§_-Aq§ && _loc4_ != §_-s2l§.§_-Oj§ && _loc4_ != §_-s2l§.§_-k25§ && _loc4_ != §_-s2l§.§_-s1R§ && _loc4_ != §_-s2l§.§_-11o§ && _loc4_ != §_-s2l§.§_-3F§)
               {
                  break;
               }
               if(Boolean(_loc4_ == §_-s2l§.§_-s1R§) && Boolean(Hero.self) && Hero.self.inHollow)
               {
                  break;
               }
               _loc17_ = _loc16_ - Game.self.nutsOld;
               this.§_-72r§ += _loc17_;
               if(_loc4_ == §_-s2l§.§_-k25§)
               {
                  break;
               }
               this.§_-i1u§(_loc17_);
               Game.self.nutsOld = _loc16_;
               break;
            case §_-s2l§.§_-QS§:
               _loc18_ = param1[0] - §_-4v§.experience;
               this.§_-V3§ += _loc18_;
               this.§_-8I§(_loc18_);
               break;
            case §_-s2l§.§_-ma§:
               §_-B2U§.§_-jx§.dispatchEvent(new GameEvent(GameEvent.TOTEM_BONUS,{
                  "id":param1[0],
                  "value":param1[1]
               }));
               break;
            case §_-s2l§.§_-g2p§:
               _loc11_ = param1[0];
               _loc19_ = int(_loc11_.length);
               _loc20_ = 0;
               while(_loc20_ < _loc19_)
               {
                  _loc3_ = get(_loc11_[_loc20_]);
                  if(_loc3_)
                  {
                     _loc25_ = _loc11_[_loc20_ + 1];
                     _loc26_ = int(_loc25_.length);
                     _loc27_ = 0;
                     while(_loc27_ < _loc26_)
                     {
                        _loc3_.perkController.§_-Zo§(_loc25_[_loc27_],_loc25_[_loc27_ + 1]);
                        _loc27_ += 2;
                     }
                     _loc3_.§_-z5§();
                  }
                  _loc20_ += 2;
               }
         }
      }
      
      private function §_-P2§(param1:int, param2:int = 0) : void
      {
         switch(param1)
         {
            case §_-s2l§.§_-a2z§:
               this.§_-i1u§(param2);
               §_-O1y§.instance.§_-m1N§(Game.selfId,"",§_-g1j§.§_-a2z§,param2);
               break;
            case §_-s2l§.§_-81A§:
               §_-u24§.sendMessage(Game.selfId,"",§_-g1j§.§_-81A§);
               break;
            case §_-s2l§.§_-01d§:
               §_-u24§.sendMessage(Game.selfId,"",§_-g1j§.§_-01d§);
         }
      }
      
      private function §_-On§(param1:GameEvent) : void
      {
         if(param1.data["reason"] == §_-s2l§.§_-l§)
         {
            return;
         }
         this.§_-e1T§ += param1.data["delta"];
         this.§_-k1r§(param1.data["delta"]);
      }
      
      private function §_-dL§(param1:GameEvent) : void
      {
         if(param1.data["reason"] == §_-s2l§.§_-H1s§)
         {
            this.§_-y2x§(param1.data["delta"]);
         }
      }
      
      private function §_-o2X§(param1:GameEvent) : void
      {
         if(!param1.data)
         {
            return;
         }
         switch(param1.data["reason"])
         {
            case §_-s2l§.§_-V1M§:
            case §_-s2l§.§_-11o§:
            case §_-s2l§.§_-49§:
            case §_-s2l§.§_-k25§:
               this.§_-z1M§ += param1.data["delta"];
               if(param1.data["reason"] != §_-s2l§.§_-k25§)
               {
                  this.§_-Y8§(param1.data["delta"]);
               }
               return;
            default:
               return;
         }
      }
      
      private function §_-i2d§() : void
      {
         if(this.§_-M2K§.length <= 0 || !get(this.§_-M2K§[0]))
         {
            this.§_-61Y§();
            return;
         }
         this.§_-81b§.§_-tu§(new Point(get(this.§_-M2K§[0]).x,get(this.§_-M2K§[0]).y - 15));
      }
      
      private function §_-61Y§(param1:Event = null) : void
      {
         if(Boolean(this.§_-81b§) && contains(this.§_-81b§))
         {
            removeChild(this.§_-81b§);
         }
         §_-p1V§.§_-DO§(this.§_-i2d§);
      }
      
      private function showAward(param1:int, param2:Class, param3:int = 0, param4:Number = 0.7) : void
      {
         if(param1 == 0 || !Hero.self)
         {
            return;
         }
         var _loc5_:Number = Hero.self.x + SquirrelGame.instance.shift.x + param3;
         var _loc6_:Number = Hero.self.y + SquirrelGame.instance.shift.y;
         §_-o1Q§.§_-K2u§(_loc5_,_loc6_,param1,§_-o1Q§.§_-Hw§(param2),param2,param4);
      }
      
      private function §_-i1u§(param1:int) : void
      {
         this.showAward(param1,ImageIconNut,55);
      }
      
      private function §_-k1r§(param1:int) : void
      {
         this.showAward(param1,ImageIconExp);
      }
      
      private function §_-Y8§(param1:uint) : void
      {
         this.showAward(param1,ImageIconMana,-40);
      }
      
      private function §_-8I§(param1:uint) : void
      {
         this.showAward(param1,ImageIconShamanExp);
      }
      
      private function §_-y2x§(param1:uint) : void
      {
         this.showAward(param1,ImageIconEnergy,90);
      }
      
      private function §_-UE§(param1:MouseEvent) : void
      {
         this.§_-w2A§.visible = false;
         this.§_-gZ§ = true;
         if(this.§_-G2n§.length == 0)
         {
            return;
         }
         var _loc2_:Object = {
            "reportedPlayerId":this.§_-G2n§[0].id,
            "targetPlayerId":Game.selfId
         };
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify(_loc2_));
      }
      
      private function §_-r1Q§(param1:Hero) : void
      {
         if(param1)
         {
            param1.respawn(param1.§_-Ha§ ? Hero.§_-629§ : Hero.§_-z29§);
         }
      }
   }
}

