package §_-l2u§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.§_-I1j§;
   import §_-8Q§.§_-O1Y§;
   import §_-8Q§.§_-O2k§;
   import §_-8Q§.§_-t20§;
   import §_-I2Y§.§_-l2r§;
   import §_-M16§.§_-02Z§;
   import §_-M16§.§_-910§;
   import §_-M16§.§_-M§;
   import §_-M16§.§_-M1u§;
   import §_-M16§.§_-P2i§;
   import §_-M16§.§_-Z26§;
   import §_-M16§.§_-bf§;
   import §_-M16§.§_-l15§;
   import §_-M16§.§_-o1l§;
   import §_-M16§.§_-o27§;
   import §_-M16§.§_-p11§;
   import §_-Mq§.DisplayObjectManager;
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import §_-ZL§.§_-lm§;
   import §_-ZL§.§_-s2j§;
   import §_-c2C§.§_-817§;
   import §_-f1T§.KeyboardEvent;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-J1a§;
   import §_-g16§.§_-I2§;
   import §_-j2H§.§_-62Y§;
   import §_-j2H§.§_-E2J§;
   import §_-j2H§.§_-H18§;
   import §_-j2H§.§_-Jb§;
   import §_-j2H§.§_-Y2n§;
   import §_-j2H§.§_-d2T§;
   import §_-j2H§.§_-r29§;
   import §_-j2H§.§_-x2h§;
   import events.§_-F2k§;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-C3G§;
   import game.mainGame.§_-Q2d§;
   import game.mainGame.entity.§_-O2M§;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-l1V§;
   import game.mainGame.entity.§_-xn§;
   import tape.§_-U1d§;
   
   public class §_-53A§ extends GameMap
   {
      
      private static const §_-M1t§:int = 10;
      
      public var _enabled:Boolean = true;
      
      public var §_-B3S§:§_-t2k§ = null;
      
      public var §_-12x§:§_-s2j§ = null;
      
      private var §_-12B§:§_-xn§ = null;
      
      private var §_-z2Z§:§_-U1d§ = null;
      
      private var §_-a12§:Number = 1;
      
      private var §_-A2T§:§_-T1Y§;
      
      private var §_-X27§:Point;
      
      public function §_-53A§(param1:SquirrelGame)
      {
         super(param1);
         this.§_-1l§.§_-920§ = false;
         this.§_-h2T§.§_-920§ = false;
         this.§_-B3S§ = new §_-t2k§(this);
         addChild(this.§_-B3S§);
         addChild(§_-o1c§);
         this.size = this.size;
         this.§_-A2T§ = new §_-T1Y§(this);
         Game.stage.doubleClickEnabled = true;
         §_-817§.instance.addEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         §_-817§.instance.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         Game.stage.addEventListener(MouseEvent.DOUBLE_CLICK,this.§_-jw§);
      }
      
      override public function dispose() : void
      {
         if(§_-62R§)
         {
            §_-62R§.removeFromParent(true);
         }
         DisplayObjectManager.getInstance().remove(backgroundLayer0);
         if(backgroundLayer0)
         {
            backgroundLayer0.removeFromParent(true);
         }
         DisplayObjectManager.getInstance().remove(backgroundLayer1);
         if(backgroundLayer1)
         {
            backgroundLayer1.removeFromParent(true);
         }
         while(§_-92x§.numChildren > 0)
         {
            §_-92x§.§_-av§(0);
         }
         backgroundLayer0 = null;
         backgroundLayer1 = null;
         §_-62R§ = null;
         super.dispose();
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-P2q§);
         Game.stage.removeEventListener(MouseEvent.DOUBLE_CLICK,this.§_-jw§);
         §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         §_-817§.instance.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         this.§_-B3S§.dispose();
         this.§_-B3S§ = null;
         this.§_-12B§ = null;
         this.§_-z2Z§ = null;
         if(this.§_-A2T§)
         {
            this.§_-A2T§.remove();
         }
         this.§_-A2T§ = null;
      }
      
      override public function set size(param1:Point) : void
      {
         if(this.§_-o1c§)
         {
            super.size = param1;
            this.§_-o1c§.graphics.clear();
            this.§_-o1c§.graphics.lineStyle(5,49427);
            this.§_-o1c§.graphics.drawRect(0,§_-Zy§.§_-02T§ * this.scale,this.size.x * this.scale,-this.size.y * this.scale);
         }
      }
      
      override public function add(param1:* = null) : void
      {
         super.add(param1);
         this.§_-uz§(param1);
         if(param1 is §_-Q2d§)
         {
            (param1 as §_-Q2d§).showDebug = true;
         }
         dispatchEvent(new §_-F2k§(param1,§_-F2k§.ADD));
      }
      
      override public function remove(param1:*, param2:Boolean = false) : void
      {
         super.remove(param1,param2);
         dispatchEvent(new §_-F2k§(param1,§_-F2k§.REMOVE));
      }
      
      override public function clear() : void
      {
         if(this.§_-A2T§)
         {
            this.§_-A2T§.hide();
         }
         this.§_-B3S§.clear();
         super.clear();
         if(!this.§_-12B§)
         {
            return;
         }
         removeChildStarling(this.§_-12B§ as §_-51g§);
         this.§_-12B§ = null;
      }
      
      override public function §_-m1Y§() : *
      {
         this.§_-d14§ = this.§_-GX§();
         return super.§_-m1Y§();
      }
      
      override public function §_-S19§(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc3_:§_-aS§ = null;
         if(!this._enabled)
         {
            super.§_-S19§(param1,param2);
            return;
         }
         for each(_loc3_ in this.objects)
         {
            if(!(!_loc3_ || !(_loc3_ is §_-51g§)))
            {
               if(_loc3_.§_-43E§ <= 0)
               {
                  _loc3_.§_-w2o§();
               }
               if(this.§_-h2T§.§_-U2E§(_loc3_))
               {
                  this.§_-h2T§.removeChildStarling(_loc3_,false);
                  if(!this.§_-1l§.§_-U2E§(_loc3_))
                  {
                     this.§_-1l§.§_-J2J§(_loc3_);
                  }
               }
               else if(!this.§_-1l§.§_-U2E§(_loc3_))
               {
                  this.§_-1l§.§_-J2J§(_loc3_);
               }
            }
         }
      }
      
      public function §_-t1J§(param1:Point) : §_-aS§
      {
         var _loc4_:§_-aS§ = null;
         if(!param1)
         {
            return null;
         }
         var _loc2_:Array = this.§_-j1c§();
         var _loc3_:* = int(_loc2_.length - 1);
         while(_loc3_ >= 0)
         {
            _loc4_ = _loc2_[_loc3_] as §_-aS§;
            if(Boolean(_loc4_) && Boolean(_loc4_ is §_-51g§) && Boolean(_loc4_.§_-31u§(param1,false)))
            {
               return _loc4_;
            }
            _loc3_--;
         }
         return null;
      }
      
      public function get §_-s6§() : Boolean
      {
         return this.§_-12B§ != null;
      }
      
      public function §_-w1m§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(§_-817§.instance);
         if(!_loc2_)
         {
            return;
         }
         this.§_-X27§ = _loc2_.§_-13l§(§_-817§.instance);
         this.§_-NP§(_loc2_);
      }
      
      public function §_-Wf§() : Boolean
      {
         return Boolean(this.§_-12x§) && this.§_-12x§.visible;
      }
      
      public function §_-P2P§(param1:§_-U1d§) : void
      {
         this.§_-z2Z§ = param1;
      }
      
      public function §_-Q1J§() : void
      {
         if(this.§_-12x§)
         {
            this.§_-12x§.hide();
         }
         this.§_-o1c§.visible = false;
      }
      
      public function §_-y1S§() : void
      {
         this.§_-o1c§.visible = true;
         this.size = this.size;
      }
      
      public function §_-W3§(param1:* = null) : void
      {
         if((this.game as §_-62b§).§_-DL§)
         {
            return;
         }
         if(this.§_-12x§)
         {
            this.§_-12x§.hide();
         }
         if(param1 == null)
         {
            if(this.§_-B3S§.§_-B3S§.length > 0)
            {
               param1 = this.§_-B3S§.§_-B3S§[0];
            }
            else
            {
               param1 = this;
            }
         }
         this.§_-12x§ = new §_-s2j§(param1);
         this.§_-12x§.show();
         this.§_-12x§.visible = true;
      }
      
      public function §_-MA§(param1:int, param2:int) : Boolean
      {
         if(param1 == §_-at§.§_-22E§ || param1 == §_-at§.§_-lg§)
         {
            return true;
         }
         if(!this.§_-538§(param1,param2))
         {
            (this.game as §_-62b§).§_-TJ§.§_-xe§(this.§_-h2S§(param1,param2));
            return false;
         }
         if(param1 != §_-at§.§_-Uf§ && this.§_-vd§(param1,param2))
         {
            (this.game as §_-62b§).§_-TJ§.§_-fL§(this.§_-42C§(param1,param2));
            return false;
         }
         return true;
      }
      
      public function §_-h2S§(param1:int, param2:int) : String
      {
         if(param1 == §_-at§.§_-N2g§ || param1 == §_-at§.§_-31L§)
         {
            return §_-CD§.§_-b2s§;
         }
         return §_-CD§.§_-bT§;
      }
      
      public function §_-42C§(param1:int, param2:int) : String
      {
         if(param1 == §_-at§.§_-N2g§ || param1 == §_-at§.§_-31L§)
         {
            return §_-CD§.§_-o2§;
         }
         return §_-CD§.§_-G2C§;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
         this.§_-B3S§.visible = param1;
         this.§_-52b§ = param1;
         if(param1)
         {
            this.§_-S19§(true,true);
            return;
         }
         this.§_-B3S§.clear();
         this.§_-B3S§.§_-o2K§();
      }
      
      public function get scale() : Number
      {
         return this.§_-a12§;
      }
      
      public function set scale(param1:Number) : void
      {
         if(this.§_-a12§ == param1)
         {
            return;
         }
         if(param1 > §_-71a§.§_-A3E§ || param1 < §_-71a§.§_-P11§)
         {
            return;
         }
         this.§_-a12§ = param1;
         this.size = this.size;
         this.§_-1l§.scaleFlashX = this.§_-1l§.scaleFlashY = param1;
         this.§_-1l§.scaleX = this.§_-1l§.scaleY = param1;
         if(this.§_-12B§ is §_-O2M§)
         {
            (this.§_-12B§ as §_-O2M§).init(param1);
         }
      }
      
      public function §_-538§(param1:int, param2:int = -1) : Boolean
      {
         return §_-FS§(§_-x2h§) && §_-FS§(§_-62Y§) && §_-FS§(§_-O2k§) && §_-FS§(§_-t20§);
      }
      
      public function §_-vd§(param1:int, param2:int = -1) : Boolean
      {
         if(param1 == §_-at§.§_-Uf§)
         {
            return false;
         }
         return §_-FS§(§_-Y2n§) || §_-FS§(§_-Jb§) || §_-FS§(§_-r29§) || §_-FS§(§_-I2§) || §_-FS§(§_-I1j§) || §_-FS§(§_-O1Y§) || §_-FS§(§_-H18§);
      }
      
      public function §_-o1j§(param1:*) : void
      {
         if(!this._enabled)
         {
            return;
         }
         this.§_-B3S§.clear();
         if(Boolean(this.§_-12B§) && this.§_-1l§.§_-U2E§(this.§_-12B§))
         {
            §_-817§.§_-Z2U§.removeChild((this.§_-12B§ as §_-51g§).getStarlingView());
         }
         if(this.§_-12B§ is §_-l2r§)
         {
            (this.§_-12B§ as §_-l2r§).dispose();
         }
         if(param1 == -1 || param1 == null)
         {
            this.§_-12B§ = null;
            Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-P2q§);
            this.§_-B3S§.visible = true;
            return;
         }
         this.§_-B3S§.visible = false;
         this.§_-12B§ = param1 is Class ? new param1() : new (§_-f1b§.§_-N1m§(param1) as Class)();
         (this.§_-12B§ as §_-aS§).alpha = 0.5;
         if(this.§_-12B§ is §_-Q2d§)
         {
            (this.§_-12B§ as §_-Q2d§).showDebug = true;
         }
         if(this.§_-12B§ is §_-O2M§)
         {
            (this.§_-12B§ as §_-O2M§).init(this.scale);
         }
         if(this.§_-12B§ is §_-d2T§)
         {
            (this.§_-12B§ as §_-d2T§).init();
         }
         var _loc2_:Point = this.globalToLocal(new Point(Game.stage.mouseX,Game.stage.mouseY));
         this.§_-12B§.position = new b2Vec2(int(_loc2_.x) / Game.§_-12A§ / this.scale,int(_loc2_.y) / Game.§_-12A§ / this.scale);
         this.§_-1l§.§_-J2J§(this.§_-12B§);
         this.§_-uz§(this.§_-12B§);
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-P2q§,false,0,true);
      }
      
      override protected function get backgroundLocation() : Array
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.game is §_-62b§)
         {
            _loc1_ = (this.game as §_-62b§).§_-63x§.§_-F2u§;
            _loc2_ = (this.game as §_-62b§).§_-63x§.mode;
         }
         else
         {
            _loc1_ = §_-lm§.location;
            _loc2_ = §_-lm§.mode;
         }
         if(_loc1_ == §_-at§.§_-I6§)
         {
            return _loc2_ == §_-at§.§_-v1M§ ? §_-C3G§.§_-Gp§(§_-at§.§_-vr§) : §_-C3G§.§_-Gp§(§_-at§.§_-I6§);
         }
         return §_-C3G§.§_-Gp§(_loc1_);
      }
      
      protected function §_-GX§() : Array
      {
         if(!this.§_-z2Z§)
         {
            return this.§_-d14§;
         }
         return this.§_-z2Z§.§_-m1Y§();
      }
      
      private function §_-uz§(param1:*) : void
      {
         if(!param1)
         {
            return;
         }
         param1.doubleClickEnabled = true;
      }
      
      private function set §_-52b§(param1:Boolean) : void
      {
         if(param1 && !this.§_-A2T§)
         {
            this.§_-A2T§ = new §_-T1Y§(this);
         }
         if(!param1 && Boolean(this.§_-A2T§))
         {
            this.§_-A2T§.remove();
            this.§_-A2T§ = null;
         }
      }
      
      private function §_-73S§(param1:KeyboardEvent) : void
      {
         if(!this.§_-Wf§() && !(Game.stage.focus is TextField))
         {
            Game.stage.focus = this;
         }
         if(Game.stage.focus != null && Game.stage.focus != this || Game.stage.focus == null)
         {
            return;
         }
         if(param1.ctrlKey)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.DELETE:
            case Keyboard.BACKSPACE:
               this.§_-B3S§.§_-xu§();
               this.§_-o1j§(null);
               break;
            case Keyboard.C:
               this.§_-o1j§(§_-910§);
               break;
            case Keyboard.V:
               this.§_-o1j§(§_-l15§);
               break;
            case Keyboard.B:
               this.§_-o1j§(§_-P2i§);
               break;
            case Keyboard.N:
               this.§_-o1j§(§_-bf§);
               break;
            case Keyboard.M:
               this.§_-o1j§(§_-02Z§);
               break;
            case Keyboard.S:
               this.§_-o1j§(§_-p11§);
               break;
            case Keyboard.G:
               this.§_-o1j§(§_-M§);
               break;
            case Keyboard.H:
               this.§_-o1j§(§_-o1l§);
               break;
            case Keyboard.COMMA:
               this.§_-o1j§(§_-M1u§);
               break;
            case Keyboard.PERIOD:
               this.§_-o1j§(§_-Z26§);
               break;
            case Keyboard.SLASH:
               this.§_-o1j§(§_-o27§);
               break;
            case Keyboard.UP:
               if(this.§_-12B§)
               {
                  this.§_-12B§.angle += §_-M1t§ * Game.D2R;
               }
               break;
            case Keyboard.DOWN:
               if(this.§_-12B§)
               {
                  this.§_-12B§.angle -= §_-M1t§ * Game.D2R;
               }
               break;
            case Keyboard.SPACE:
               if(!(this.game as §_-62b§).§_-DL§)
               {
                  (this.game as §_-62b§).header.§_-p20§();
               }
         }
      }
      
      private function §_-NP§(param1:§_-J1a§) : void
      {
         var _loc2_:Point = null;
         if(Boolean(param1 && param1.§_-ca§) && Boolean(param1.§_-n2z§) && Boolean(this.§_-12B§))
         {
            _loc2_ = this.globalToLocal(new Point(param1.§_-ca§,param1.§_-n2z§));
            this.§_-12B§.position = new b2Vec2(_loc2_.x / Game.§_-12A§ / this.scale,_loc2_.y / Game.§_-12A§ / this.scale);
         }
         if(this._enabled)
         {
            this.§_-S19§(true);
         }
      }
      
      private function §_-P2q§(param1:MouseEvent) : void
      {
         var _loc4_:§_-aS§ = null;
         this.§_-B3S§.visible = true;
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-P2q§);
         if(this.§_-12B§ is §_-l1V§)
         {
            --this.§_-X27§.x;
            --this.§_-X27§.y;
            _loc4_ = this.§_-t1J§(this.§_-X27§);
            if(_loc4_ is §_-E2J§)
            {
               (this.§_-12B§ as §_-l1V§).§_-I2Q§(_loc4_);
            }
            _loc4_ = null;
         }
         if(!this.§_-12B§)
         {
            return;
         }
         (this.§_-12B§ as §_-aS§).alpha = 1;
         if(this.§_-12B§ is §_-l1V§)
         {
            (this.§_-12B§ as §_-51g§).removeFromParent();
            this.§_-12B§ = null;
            return;
         }
         this.add(this.§_-12B§);
         var _loc2_:int = §_-f1b§.§_-q2W§(this.§_-12B§);
         var _loc3_:Number = this.§_-12B§.angle;
         this.§_-12B§ = null;
         if(!param1.ctrlKey)
         {
            return;
         }
         this.§_-o1j§(_loc2_);
         this.§_-12B§.angle = _loc3_;
      }
      
      private function §_-jw§(param1:MouseEvent) : void
      {
         var _loc3_:§_-aS§ = null;
         var _loc4_:Point = null;
         if((this.game as §_-62b§).§_-DL§)
         {
            return;
         }
         var _loc2_:* = int(this.§_-1l§.numChildren - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.§_-1l§.§_-kD§(_loc2_--);
            _loc4_ = this.§_-X27§;
            if(!(_loc3_ is §_-l1V§) && Boolean(_loc3_.§_-31u§(_loc4_,false)))
            {
               this.§_-B3S§.§_-o2K§();
               this.§_-W3§(_loc3_);
               break;
            }
         }
      }
   }
}

