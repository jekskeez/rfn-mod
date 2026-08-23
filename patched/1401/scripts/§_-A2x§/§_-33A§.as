package §_-A2x§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.§_-o29§;
   import §_-8I§.SquirrelEvent;
   import §_-8I§.SquirrelGameEvent;
   import §_-A2E§.§_-e1T§;
   import §_-I10§.§_-B3s§;
   import §_-I10§.§_-Z1F§;
   import §_-I10§.§_-ct§;
   import §_-I10§.§_-d2x§;
   import §_-I10§.§_-vy§;
   import §_-S1D§.§_-O1M§;
   import §_-T2y§.§_-92z§;
   import §_-dc§.§_-e2W§;
   import §_-s2l§.ControllerHeroLocal;
   import §_-s2l§.ControllerHeroRemote;
   import chat.§_-A1n§;
   import chat.§_-r0§;
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
   import game.mainGame.§_-Iw§;
   import game.mainGame.§_-L2k§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-93C§;
   import utils.§_-R1F§;
   import utils.§_-c10§;
   import utils.§_-r2N§;
   
   public class §_-33A§ extends SquirrelCollection
   {
      
      private static var _instance:§_-33A§;
      
      public var locationId:int = -1;
      
      public var §_-o2a§:int = 0;
      
      public var respawn:int = 0;
      
      public var §_-W2M§:int = 0;
      
      protected var §_-Ex§:Array = [];
      
      protected var §_-q2Q§:Object = {};
      
      private var §_-VF§:uint = 0;
      
      private var §_-YX§:uint = 0;
      
      private var §_-K1S§:uint = 0;
      
      private var §_-t2B§:uint = 0;
      
      private var §_-82C§:Array = [];
      
      private var §_-h2u§:Array = [];
      
      private var §_-53p§:§_-Iw§ = null;
      
      private var §_-ZY§:Object = {};
      
      private var §_-xl§:Array;
      
      private var §_-B1Q§:§_-L2k§ = null;
      
      private var §_-n2W§:Boolean = false;
      
      private var §_-C1q§:§_-e1T§ = null;
      
      public function §_-33A§()
      {
         _instance = this;
         super();
         §_-Ck§();
         this.§_-V2y§.start();
         var _loc1_:ShamanDead = new ShamanDead();
         var _loc2_:Bitmap = §_-93C§.§_-e2o§(_loc1_,_loc1_.width,_loc1_.height);
         _loc2_.smoothing = true;
         _loc2_.blendMode = BlendMode.SCREEN;
         this.§_-53p§ = new §_-Iw§(_loc2_,20);
         this.§_-53p§.addEventListener("Finished",this.§_-vx§);
         this.mouseChildren = true;
         this.mouseEnabled = true;
         this.§_-B1Q§ = new §_-L2k§();
         this.§_-B1Q§.addEventListener(MouseEvent.CLICK,this.§_-W1P§);
         this.§_-C1q§ = new §_-e1T§(§_-R1c§.§_-D1D§);
         §_-d2x§.addEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-iE§);
         §_-Z1F§.addEventListener(GameEvent.MANA_CHANGED,this.§_-sG§);
         §_-Z1F§.addEventListener(GameEvent.ENERGY_CHANGED,this.§_-22C§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-Hk§,§_-S2I§.§_-R28§,§_-S2I§.§_-jr§,§_-S2I§.§_-82J§,§_-S2I§.§_-E25§,§_-S2I§.§_-Aa§,§_-S2I§.§_-Vs§,§_-S2I§.§_-u2N§,§_-S2I§.§_-e1h§,§_-S2I§.§_-F2m§,§_-S2I§.§_-b1y§,§_-S2I§.§_-03G§,§_-S2I§.§_-63o§,§_-S2I§.§_-s1J§,§_-S2I§.§_-cb§,§_-S2I§.§_-F17§,§_-S2I§.§_-926§],1);
      }
      
      public static function get §_-fA§() : int
      {
         return _instance ? _instance.§_-o2a§ : 0;
      }
      
      public static function get §_-xB§() : int
      {
         return _instance ? _instance.§_-31S§ : 0;
      }
      
      public static function get §_-C3h§() : int
      {
         return _instance ? _instance.§_-p1d§ : 0;
      }
      
      public static function get §_-QO§() : int
      {
         return _instance ? _instance.§_-Bo§ : 0;
      }
      
      public static function get §_-o2§() : int
      {
         return _instance ? int(_instance.§_-Pn§) : 0;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-C1q§)
         {
            this.§_-C1q§.update(param1);
         }
      }
      
      override public function round(param1:Array) : void
      {
         switch(param1[0])
         {
            case §_-S2I§.ROUND_STARTING:
               this.§_-B1Q§.visible = false;
               this.§_-Ex§ = [];
               this.§_-82C§ = [];
               this.§_-h2u§ = [];
               this.§_-q2Q§ = {};
            case §_-S2I§.ROUND_WAITING:
            case §_-S2I§.ROUND_PLAYING:
            case §_-S2I§.§_-RO§:
               hide();
               break;
            case §_-S2I§.ROUND_START:
               if(§_-92z§.§_-32S§ == 0)
               {
                  ControllerHeroLocal.§_-jL§ = false;
               }
               this.§_-ZY§ = {};
               this.§_-B1Q§.visible = false;
               this.§_-n2W§ = false;
               this.§_-B1Q§.reset();
               this.§_-o2a§ = 0;
               this.§_-W2M§ = 0;
               this.respawn = 0;
               this.§_-g14§ = false;
               §_-O1M§.§_-22R§ = false;
               reset();
               this.§_-J1u§();
               this.§_-h14§();
               place();
               show();
               §_-O1M§.§_-22R§ = true;
               this.§_-31S§ = 0;
               this.§_-p1d§ = 0;
               this.§_-Bo§ = 0;
               this.§_-Pn§ = 0;
         }
      }
      
      override public function §_-U1m§(param1:Boolean = true) : void
      {
         this.§_-xl§ = super.§_-k8§();
         if(this.§_-xl§.length == 1 && this.§_-xl§[0].id != Game.selfId && !this.§_-n2W§)
         {
            this.§_-B1Q§.visible = true;
            this.§_-xl§[0].addViewButton(this.§_-B1Q§);
         }
         else if(param1)
         {
            if(this.§_-n2W§)
            {
               §_-92z§.§_-z2U§();
               this.§_-n2W§ = false;
            }
            this.§_-B1Q§.visible = false;
         }
      }
      
      override public function §_-83Q§(param1:int, param2:int) : Boolean
      {
         if(param2 in this.§_-ZY§)
         {
            return false;
         }
         if(§_-h2M§(param1,param2))
         {
            return false;
         }
         this.§_-ZY§[param2] = true;
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"GumWith":[param1,param2]}));
         return true;
      }
      
      override public function §_-K14§() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-Ex§)
         {
            if(get(_loc2_) != null)
            {
               _loc1_.push(get(_loc2_));
            }
         }
         return _loc1_;
      }
      
      override public function §_-B1q§(param1:Array, param2:Boolean = true) : void
      {
         this.§_-I19§();
         super.§_-B1q§(param1,param2);
      }
      
      override public function add(param1:int) : void
      {
         super.add(param1);
         if(param1 != Game.selfId)
         {
            return;
         }
         this.§_-h14§();
         §_-O1M§.hero = Hero.self;
      }
      
      override public function remove(param1:int) : void
      {
         super.remove(param1);
         if(this.count > 1 || !GameMap.instance)
         {
            return;
         }
         (GameMap.instance as GameMapNet).§_-dJ§.§_-G1U§ = false;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _instance = null;
         if(this.§_-53p§)
         {
            this.§_-53p§.removeEventListener("Finished",this.§_-vx§);
            this.§_-vx§();
            this.§_-53p§ = null;
         }
         if(this.§_-C1q§)
         {
            this.§_-C1q§.dispose();
            this.§_-C1q§ = null;
         }
         §_-O1M§.hero = null;
         §_-Z1F§.removeEventListener(GameEvent.MANA_CHANGED,this.§_-sG§);
         §_-Z1F§.removeEventListener(GameEvent.ENERGY_CHANGED,this.§_-22C§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-Hk§,§_-S2I§.§_-R28§,§_-S2I§.§_-jr§,§_-S2I§.§_-82J§,§_-S2I§.§_-E25§,§_-S2I§.§_-Aa§,§_-S2I§.§_-Vs§,§_-S2I§.§_-u2N§,§_-S2I§.§_-e1h§,§_-S2I§.§_-F2m§,§_-S2I§.§_-b1y§,§_-S2I§.§_-03G§,§_-S2I§.§_-63o§,§_-S2I§.§_-s1J§,§_-S2I§.§_-cb§,§_-S2I§.§_-F17§,§_-S2I§.§_-926§]);
      }
      
      public function get §_-p1d§() : int
      {
         return this.§_-YX§;
      }
      
      public function set §_-p1d§(param1:int) : void
      {
         this.§_-YX§ = param1;
         dispatchEvent(new SquirrelGameEvent(SquirrelGameEvent.UPDATE_BONUS));
      }
      
      public function get §_-Bo§() : int
      {
         return this.§_-K1S§;
      }
      
      public function set §_-Bo§(param1:int) : void
      {
         this.§_-K1S§ = param1;
         dispatchEvent(new SquirrelGameEvent(SquirrelGameEvent.UPDATE_BONUS));
      }
      
      public function get §_-Pn§() : uint
      {
         return this.§_-t2B§;
      }
      
      public function set §_-Pn§(param1:uint) : void
      {
         this.§_-t2B§ = param1;
         dispatchEvent(new SquirrelGameEvent(SquirrelGameEvent.UPDATE_BONUS));
      }
      
      public function get §_-31S§() : int
      {
         return this.§_-VF§;
      }
      
      public function set §_-31S§(param1:int) : void
      {
         this.§_-VF§ = param1;
         dispatchEvent(new SquirrelGameEvent(SquirrelGameEvent.UPDATE_BONUS));
      }
      
      override protected function §_-y2G§(param1:SquirrelEvent = null) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-F2m§,Hero.self.position.x,Hero.self.position.y,Hero.self.§_-L1A§);
      }
      
      override protected function §_-T1T§(param1:int) : void
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
      
      protected function §_-h14§() : void
      {
         if(!Hero.self)
         {
            return;
         }
         Hero.self.§_-l2U§.§_-iU§(§_-R1F§.§_-8g§(§_-B3s§.items));
      }
      
      protected function §_-J1u§() : void
      {
         this.§_-B1q§(this.§_-Ex§);
         §_-M13§(this.§_-82C§);
         §_-GM§(this.§_-h2u§);
      }
      
      protected function §_-I19§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:String = null;
         for each(_loc1_ in this.players)
         {
            _loc1_.team = Hero.§_-JL§;
         }
         for(_loc2_ in this.§_-q2Q§)
         {
            _loc1_ = get(int(_loc2_));
            if(_loc1_)
            {
               _loc1_.team = this.§_-q2Q§[_loc2_];
            }
         }
      }
      
      protected function §_-s2r§() : void
      {
         var _loc1_:int = 0;
         if(Boolean(this.§_-Ex§) && Boolean(this.§_-Ex§.length > 0) && Boolean(get(this.§_-Ex§[0])))
         {
            §_-01Y§.§_-h1R§(this.§_-83u§);
            if(get(this.§_-Ex§[0]).id != Game.selfId)
            {
               _loc1_ = Math.random() * §_-43Z§.§_-Z1o§.length;
               GameSounds.playUnrepeatable(§_-43Z§.§_-Z1o§[_loc1_]);
            }
            if(!contains(this.§_-53p§))
            {
               this.§_-53p§.setPosition(get(this.§_-Ex§[0]).x + 30,get(this.§_-Ex§[0]).y - 40);
               addChild(this.§_-53p§);
            }
         }
      }
      
      protected function §_-o2C§(param1:§_-S2I§) : void
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
            case §_-S2I§.§_-Hk§:
               set(param1[2]);
               this.add(Game.selfId);
               hide();
               break;
            case §_-S2I§.§_-R28§:
               _loc2_ = int(param1[0]);
               _loc3_ = get(_loc2_);
               if(!_loc3_)
               {
                  return;
               }
               _loc6_ = _loc3_.§_-89§;
               _loc3_.dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-n1x§,_loc3_));
               this.remove(_loc2_);
               if(!_loc6_)
               {
                  this.§_-U1m§(false);
               }
               break;
            case §_-S2I§.§_-jr§:
               §_-46§(param1[0]);
               break;
            case §_-S2I§.§_-82J§:
               this.§_-s2r§();
               this.§_-Ex§ = param1[0];
               this.§_-q2Q§ = {};
               _loc7_ = int(this.§_-Ex§.length);
               _loc20_ = 0;
               while(_loc20_ < _loc7_)
               {
                  this.§_-q2Q§[this.§_-Ex§[_loc20_]] = param1[1][_loc20_];
                  _loc20_++;
               }
               this.§_-B1q§(this.§_-Ex§,false);
               for each(_loc21_ in this.§_-Ex§)
               {
                  if(_loc21_)
                  {
                     §_-92z§.sendMessage(_loc21_,"",§_-A1n§.§_-S2i§);
                  }
               }
               this.§_-U1m§();
               break;
            case §_-S2I§.§_-E25§:
               _loc8_ = param1[0];
               _loc9_ = int(_loc8_.length);
               _loc20_ = 0;
               while(_loc20_ < _loc9_)
               {
                  switch(_loc8_[_loc20_])
                  {
                     case §_-S2I§.§_-E1Z§:
                        this.§_-h2u§ = _loc8_[_loc20_ + 1];
                        §_-GM§(this.§_-h2u§);
                        break;
                     case §_-S2I§.§_-Xo§:
                        this.§_-82C§ = _loc8_[_loc20_ + 1];
                        §_-M13§(this.§_-82C§);
                  }
                  _loc20_ += 2;
               }
               break;
            case §_-S2I§.§_-Aa§:
               _loc3_ = get(param1[0]);
               if(!_loc3_)
               {
                  return;
               }
               _loc3_.§_-4j§(param1[1] == §_-h2B§.§_-BW§ ? Hero.§_-517§ : Hero.§_-VP§);
               break;
            case §_-S2I§.§_-Vs§:
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
                  ControllerHeroLocal.§_-jL§ = !Hero.self.isHare;
                  if(Hero.self.isHare && !this.§_-TV§(false))
                  {
                     Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-BW§);
                     Connection.§_-Li§(§_-h2B§.§_-Vs§,0);
                  }
               }
               if(_loc2_ == Game.selfId && this.locationId == §_-q1p§.§_-X1n§ && this.§_-TV§(false))
               {
                  §_-92z§.§_-V2l§();
               }
               this.§_-U1m§();
               break;
            case §_-S2I§.§_-u2N§:
               this.§_-z27§(param1[0],param1[1]);
               break;
            case §_-S2I§.§_-e1h§:
               _loc2_ = int(param1[0]);
               this.add(_loc2_);
               if(param1[1] == §_-S2I§.§_-C1g§)
               {
                  get(_loc2_).hide();
               }
               if(Boolean(Hero.self) && (Hero.self.position.x != 0 && Hero.self.position.y != 0))
               {
                  Hero.self.sendLocation();
               }
               break;
            case §_-S2I§.§_-F2m§:
               this.§_-U1m§();
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
               _loc3_.§_-L1A§ = param1[3];
               _loc3_.dead = true;
               if(_loc3_.isHare)
               {
                  GameSounds.play(§_-43Z§.§_-Sp§[int(Math.random() * §_-43Z§.§_-Sp§.length)]);
               }
               if(Boolean(Hero.self) && Boolean(!this.§_-TV§(false)) && Hero.self.isHare)
               {
                  _loc3_.§_-L1A§ = Hero.§_-i22§;
                  _loc3_.dead = true;
                  break;
               }
               this.§_-U1m§();
               _loc10_ = this.get(this.§_-82C§[0]);
               if(Boolean(!_loc3_.isHare && this.§_-82C§.length > 0) && Boolean(_loc10_) && !_loc10_.isDead)
               {
                  GameSounds.playUnrepeatable("hare_killer",§_-31F§.§_-Y2M§);
               }
               break;
            case §_-S2I§.§_-b1y§:
               _loc11_ = param1[1];
               if("GumWith" in _loc11_)
               {
                  _loc22_ = _loc11_["GumWith"];
                  _loc23_ = int(_loc22_[0]);
                  _loc24_ = int(_loc22_[1]);
                  if(_loc23_ == Game.selfId)
                  {
                     delete this.§_-ZY§[_loc24_];
                  }
                  super.§_-83Q§(_loc23_,_loc24_);
               }
               break;
            case §_-S2I§.§_-03G§:
               _loc12_ = int(param1[0]);
               _loc2_ = int(param1[1]);
               _loc3_ = get(_loc2_);
               if(!_loc3_)
               {
                  return;
               }
               if(!_loc3_.isDead || _loc12_ == §_-S2I§.§_-8n§)
               {
                  break;
               }
               _loc4_ = int(param1[2]);
               switch(_loc4_)
               {
                  case §_-S2I§.§_-h5§:
                     _loc3_.teleport(Hero.§_-98§);
                     break;
                  case §_-S2I§.§_-y1n§:
                     break;
                  default:
                     _loc5_ = _loc2_ == Game.selfId;
                     if(_loc5_ && _loc4_ == §_-S2I§.§_-7E§)
                     {
                        ++this.§_-o2a§;
                     }
                     if(_loc5_ && _loc4_ == §_-S2I§.§_-67§)
                     {
                        ++this.§_-W2M§;
                     }
                     ++this.respawn;
                     _loc3_.shaman = false;
                     _loc3_.teleport(Hero.§_-o3§);
                     setTimeout(this.§_-5Y§,0,_loc3_);
               }
               break;
            case §_-S2I§.§_-63o§:
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
                  this.§_-g14§ = true;
               }
               if(_loc5_ && !§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§))
               {
                  break;
               }
               _loc15_ = _loc13_ == §_-o29§.§_-Y1l§ ? §_-vy§.§_-U2M§[_loc14_]["tittle"] : "";
               §_-92z§.sendMessage(_loc2_,_loc15_,§_-A1n§.§_-21b§);
               break;
            case §_-S2I§.§_-s1J§:
               _loc16_ = int(param1[1]);
               _loc4_ = int(param1[2]);
               if(_loc4_ != §_-S2I§.§_-43c§ && _loc4_ != §_-S2I§.§_-f1g§ && _loc4_ != §_-S2I§.§_-dn§ && _loc4_ != §_-S2I§.§_-52J§ && _loc4_ != §_-S2I§.§_-V1q§ && _loc4_ != §_-S2I§.§_-M1E§)
               {
                  break;
               }
               if(Boolean(_loc4_ == §_-S2I§.§_-52J§) && Boolean(Hero.self) && Hero.self.inHollow)
               {
                  break;
               }
               _loc17_ = _loc16_ - Game.self.nutsOld;
               this.§_-31S§ += _loc17_;
               if(_loc4_ == §_-S2I§.§_-dn§)
               {
                  break;
               }
               this.§_-72W§(_loc17_);
               Game.self.nutsOld = _loc16_;
               break;
            case §_-S2I§.§_-cb§:
               _loc18_ = param1[0] - §_-ct§.experience;
               this.§_-Bo§ += _loc18_;
               this.§_-C1x§(_loc18_);
               break;
            case §_-S2I§.§_-F17§:
               §_-e2W§.§_-u1o§.dispatchEvent(new GameEvent(GameEvent.TOTEM_BONUS,{
                  "id":param1[0],
                  "value":param1[1]
               }));
               break;
            case §_-S2I§.§_-926§:
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
                        _loc3_.perkController.§_-g1D§(_loc25_[_loc27_],_loc25_[_loc27_ + 1]);
                        _loc27_ += 2;
                     }
                     _loc3_.§_-52o§();
                  }
                  _loc20_ += 2;
               }
         }
      }
      
      private function §_-z27§(param1:int, param2:int = 0) : void
      {
         switch(param1)
         {
            case §_-S2I§.§_-s1R§:
               this.§_-72W§(param2);
               §_-r0§.instance.§_-n1I§(Game.selfId,"",§_-A1n§.§_-s1R§,param2);
               break;
            case §_-S2I§.§_-t2D§:
               §_-92z§.sendMessage(Game.selfId,"",§_-A1n§.§_-t2D§);
               break;
            case §_-S2I§.§_-L1m§:
               §_-92z§.sendMessage(Game.selfId,"",§_-A1n§.§_-L1m§);
         }
      }
      
      private function §_-iE§(param1:GameEvent) : void
      {
         if(param1.data["reason"] == §_-S2I§.§_-kn§)
         {
            return;
         }
         this.§_-p1d§ += param1.data["delta"];
         this.§_-A3U§(param1.data["delta"]);
      }
      
      private function §_-22C§(param1:GameEvent) : void
      {
         if(param1.data["reason"] == §_-S2I§.§_-62h§)
         {
            this.§_-Bp§(param1.data["delta"]);
         }
      }
      
      private function §_-sG§(param1:GameEvent) : void
      {
         if(!param1.data)
         {
            return;
         }
         switch(param1.data["reason"])
         {
            case §_-S2I§.§_-62C§:
            case §_-S2I§.§_-V1q§:
            case §_-S2I§.§_-93W§:
            case §_-S2I§.§_-dn§:
               this.§_-Pn§ += param1.data["delta"];
               if(param1.data["reason"] != §_-S2I§.§_-dn§)
               {
                  this.§_-GK§(param1.data["delta"]);
               }
               return;
            default:
               return;
         }
      }
      
      private function §_-83u§() : void
      {
         if(this.§_-Ex§.length <= 0 || !get(this.§_-Ex§[0]))
         {
            this.§_-vx§();
            return;
         }
         this.§_-53p§.§_-V2V§(new Point(get(this.§_-Ex§[0]).x,get(this.§_-Ex§[0]).y - 15));
      }
      
      private function §_-vx§(param1:Event = null) : void
      {
         if(Boolean(this.§_-53p§) && contains(this.§_-53p§))
         {
            removeChild(this.§_-53p§);
         }
         §_-01Y§.§_-t1s§(this.§_-83u§);
      }
      
      private function showAward(param1:int, param2:Class, param3:int = 0, param4:Number = 0.7) : void
      {
         if(param1 == 0 || !Hero.self)
         {
            return;
         }
         var _loc5_:Number = Hero.self.x + SquirrelGame.instance.shift.x + param3;
         var _loc6_:Number = Hero.self.y + SquirrelGame.instance.shift.y;
         §_-r2N§.§_-A3v§(_loc5_,_loc6_,param1,§_-r2N§.§_-o1o§(param2),param2,param4);
      }
      
      private function §_-72W§(param1:int) : void
      {
         this.showAward(param1,ImageIconNut,55);
      }
      
      private function §_-A3U§(param1:int) : void
      {
         this.showAward(param1,ImageIconExp);
      }
      
      private function §_-GK§(param1:uint) : void
      {
         this.showAward(param1,ImageIconMana,-40);
      }
      
      private function §_-C1x§(param1:uint) : void
      {
         this.showAward(param1,ImageIconShamanExp);
      }
      
      private function §_-Bp§(param1:uint) : void
      {
         this.showAward(param1,ImageIconEnergy,90);
      }
      
      private function §_-W1P§(param1:MouseEvent) : void
      {
         this.§_-B1Q§.visible = false;
         this.§_-n2W§ = true;
         if(this.§_-xl§.length == 0)
         {
            return;
         }
         var _loc2_:Object = {
            "reportedPlayerId":this.§_-xl§[0].id,
            "targetPlayerId":Game.selfId
         };
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify(_loc2_));
      }
      
      private function §_-5Y§(param1:Hero) : void
      {
         if(param1)
         {
            param1.respawn(param1.§_-la§ ? Hero.§_-F1P§ : Hero.§_-M2Q§);
         }
      }
   }
}

