package §_-Rj§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-1T§.DisplayObjectManager;
   import §_-83V§.§_-532§;
   import §_-83V§.§_-I11§;
   import §_-83V§.§_-P2o§;
   import §_-83V§.§_-Q1J§;
   import §_-B1O§.§_-S18§;
   import §_-B1O§.§_-T24§;
   import §_-B1O§.§_-W2J§;
   import §_-B1O§.§_-f24§;
   import §_-B1O§.§_-i26§;
   import §_-B1O§.§_-i2t§;
   import §_-B1O§.§_-l2J§;
   import §_-B1O§.§_-rJ§;
   import §_-K2c§.KeyboardEvent;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-Q1P§.§_-h3§;
   import §_-Q1P§.§_-y2d§;
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import §_-Rn§.§_-31R§;
   import §_-Rn§.§_-83t§;
   import §_-Rn§.§_-J2f§;
   import §_-Rn§.§_-Mb§;
   import §_-Rn§.§_-W1w§;
   import §_-Rn§.§_-X1D§;
   import §_-Rn§.§_-Xx§;
   import §_-Rn§.§_-k1G§;
   import §_-Rn§.§_-lT§;
   import §_-Rn§.§_-q1m§;
   import §_-Rn§.§_-s12§;
   import §_-T2y§.§_-s1i§;
   import §_-Y22§.§_-C2x§;
   import §_-d11§.§_-k1J§;
   import events.§_-63A§;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-8B§;
   import game.mainGame.§_-92y§;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-E1U§;
   import game.mainGame.entity.§_-u2S§;
   import tape.§_-Z1t§;
   
   public class §_-K15§ extends GameMap
   {
      
      private static const §_-C1a§:int = 10;
      
      public var _enabled:Boolean = true;
      
      public var §_-K1n§:§_-uq§ = null;
      
      public var §_-t1P§:§_-h3§ = null;
      
      private var §_-w2U§:§_-63Q§ = null;
      
      private var §_-H1k§:§_-Z1t§ = null;
      
      private var §_-Tq§:Number = 1;
      
      private var §_-WO§:§_-U2h§;
      
      private var §_-kX§:Point;
      
      public function §_-K15§(param1:SquirrelGame)
      {
         super(param1);
         this.§_-kz§.§_-X2C§ = false;
         this.§_-G12§.§_-X2C§ = false;
         this.§_-K1n§ = new §_-uq§(this);
         addChild(this.§_-K1n§);
         addChild(§_-Df§);
         this.size = this.size;
         this.§_-WO§ = new §_-U2h§(this);
         Game.stage.doubleClickEnabled = true;
         §_-s1i§.instance.addEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         §_-s1i§.instance.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         Game.stage.addEventListener(MouseEvent.DOUBLE_CLICK,this.§_-a6§);
      }
      
      override public function dispose() : void
      {
         if(§_-52P§)
         {
            §_-52P§.removeFromParent(true);
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
         while(§_-gY§.numChildren > 0)
         {
            §_-gY§.§_-n2T§(0);
         }
         backgroundLayer0 = null;
         backgroundLayer1 = null;
         §_-52P§ = null;
         super.dispose();
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-kG§);
         Game.stage.removeEventListener(MouseEvent.DOUBLE_CLICK,this.§_-a6§);
         §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         §_-s1i§.instance.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         this.§_-K1n§.dispose();
         this.§_-K1n§ = null;
         this.§_-w2U§ = null;
         this.§_-H1k§ = null;
         if(this.§_-WO§)
         {
            this.§_-WO§.remove();
         }
         this.§_-WO§ = null;
      }
      
      override public function set size(param1:Point) : void
      {
         if(this.§_-Df§)
         {
            super.size = param1;
            this.§_-Df§.graphics.clear();
            this.§_-Df§.graphics.lineStyle(5,49427);
            this.§_-Df§.graphics.drawRect(0,§_-a9§.§_-31m§ * this.scale,this.size.x * this.scale,-this.size.y * this.scale);
         }
      }
      
      override public function add(param1:* = null) : void
      {
         super.add(param1);
         this.§_-R2H§(param1);
         if(param1 is §_-8B§)
         {
            (param1 as §_-8B§).showDebug = true;
         }
         dispatchEvent(new §_-63A§(param1,§_-63A§.ADD));
      }
      
      override public function remove(param1:*, param2:Boolean = false) : void
      {
         super.remove(param1,param2);
         dispatchEvent(new §_-63A§(param1,§_-63A§.REMOVE));
      }
      
      override public function clear() : void
      {
         if(this.§_-WO§)
         {
            this.§_-WO§.hide();
         }
         this.§_-K1n§.clear();
         super.clear();
         if(!this.§_-w2U§)
         {
            return;
         }
         removeChildStarling(this.§_-w2U§ as §_-v2j§);
         this.§_-w2U§ = null;
      }
      
      override public function §_-A1X§() : *
      {
         this.§_-u1T§ = this.§_-AH§();
         return super.§_-A1X§();
      }
      
      override public function §_-v2t§(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc3_:§_-h2I§ = null;
         if(!this._enabled)
         {
            super.§_-v2t§(param1,param2);
            return;
         }
         for each(_loc3_ in this.objects)
         {
            if(!(!_loc3_ || !(_loc3_ is §_-v2j§)))
            {
               if(_loc3_.§_-C20§ <= 0)
               {
                  _loc3_.§_-IB§();
               }
               if(this.§_-G12§.§_-ws§(_loc3_))
               {
                  this.§_-G12§.removeChildStarling(_loc3_,false);
                  if(!this.§_-kz§.§_-ws§(_loc3_))
                  {
                     this.§_-kz§.§_-83v§(_loc3_);
                  }
               }
               else if(!this.§_-kz§.§_-ws§(_loc3_))
               {
                  this.§_-kz§.§_-83v§(_loc3_);
               }
            }
         }
      }
      
      public function §_-GH§(param1:Point) : §_-h2I§
      {
         var _loc4_:§_-h2I§ = null;
         if(!param1)
         {
            return null;
         }
         var _loc2_:Array = this.§_-8q§();
         var _loc3_:* = int(_loc2_.length - 1);
         while(_loc3_ >= 0)
         {
            _loc4_ = _loc2_[_loc3_] as §_-h2I§;
            if(Boolean(_loc4_) && Boolean(_loc4_ is §_-v2j§) && Boolean(_loc4_.§_-iu§(param1,false)))
            {
               return _loc4_;
            }
            _loc3_--;
         }
         return null;
      }
      
      public function get §_-X7§() : Boolean
      {
         return this.§_-w2U§ != null;
      }
      
      public function §_-K1G§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(§_-s1i§.instance);
         if(!_loc2_)
         {
            return;
         }
         this.§_-kX§ = _loc2_.§_-l29§(§_-s1i§.instance);
         this.§_-G2D§(_loc2_);
      }
      
      public function §_-k6§() : Boolean
      {
         return Boolean(this.§_-t1P§) && this.§_-t1P§.visible;
      }
      
      public function §_-G2F§(param1:§_-Z1t§) : void
      {
         this.§_-H1k§ = param1;
      }
      
      public function §_-w1B§() : void
      {
         if(this.§_-t1P§)
         {
            this.§_-t1P§.hide();
         }
         this.§_-Df§.visible = false;
      }
      
      public function §_-z2l§() : void
      {
         this.§_-Df§.visible = true;
         this.size = this.size;
      }
      
      public function §_-o12§(param1:* = null) : void
      {
         if((this.game as §_-A32§).§_-j1P§)
         {
            return;
         }
         if(this.§_-t1P§)
         {
            this.§_-t1P§.hide();
         }
         if(param1 == null)
         {
            if(this.§_-K1n§.§_-K1n§.length > 0)
            {
               param1 = this.§_-K1n§.§_-K1n§[0];
            }
            else
            {
               param1 = this;
            }
         }
         this.§_-t1P§ = new §_-h3§(param1);
         this.§_-t1P§.show();
         this.§_-t1P§.visible = true;
      }
      
      public function §_-sr§(param1:int, param2:int) : Boolean
      {
         if(param1 == §_-q1p§.§_-u2f§ || param1 == §_-q1p§.§_-l2I§)
         {
            return true;
         }
         if(!this.§_-WH§(param1,param2))
         {
            (this.game as §_-A32§).§_-US§.§_-11P§(this.§_-u2E§(param1,param2));
            return false;
         }
         if(param1 != §_-q1p§.§_-G1z§ && this.§_-Z2S§(param1,param2))
         {
            (this.game as §_-A32§).§_-US§.§_-m1x§(this.§_-d1E§(param1,param2));
            return false;
         }
         return true;
      }
      
      public function §_-u2E§(param1:int, param2:int) : String
      {
         if(param1 == §_-q1p§.§_-M1m§ || param1 == §_-q1p§.§_-k2m§)
         {
            return §_-y1z§.§_-jZ§;
         }
         return §_-y1z§.§_-7§;
      }
      
      public function §_-d1E§(param1:int, param2:int) : String
      {
         if(param1 == §_-q1p§.§_-M1m§ || param1 == §_-q1p§.§_-k2m§)
         {
            return §_-y1z§.§_-I22§;
         }
         return §_-y1z§.§_-X1x§;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
         this.§_-K1n§.visible = param1;
         this.§_-c2s§ = param1;
         if(param1)
         {
            this.§_-v2t§(true,true);
            return;
         }
         this.§_-K1n§.clear();
         this.§_-K1n§.§_-Hx§();
      }
      
      public function get scale() : Number
      {
         return this.§_-Tq§;
      }
      
      public function set scale(param1:Number) : void
      {
         if(this.§_-Tq§ == param1)
         {
            return;
         }
         if(param1 > §_-C2q§.§_-c1K§ || param1 < §_-C2q§.§_-H13§)
         {
            return;
         }
         this.§_-Tq§ = param1;
         this.size = this.size;
         this.§_-kz§.scaleFlashX = this.§_-kz§.scaleFlashY = param1;
         this.§_-kz§.scaleX = this.§_-kz§.scaleY = param1;
         if(this.§_-w2U§ is §_-E1U§)
         {
            (this.§_-w2U§ as §_-E1U§).init(param1);
         }
      }
      
      public function §_-WH§(param1:int, param2:int = -1) : Boolean
      {
         return §_-2S§(§_-f24§) && §_-2S§(§_-rJ§) && §_-2S§(§_-P2o§) && §_-2S§(§_-Q1J§);
      }
      
      public function §_-Z2S§(param1:int, param2:int = -1) : Boolean
      {
         if(param1 == §_-q1p§.§_-G1z§)
         {
            return false;
         }
         return §_-2S§(§_-S18§) || §_-2S§(§_-T24§) || §_-2S§(§_-W2J§) || §_-2S§(§_-k1J§) || §_-2S§(§_-I11§) || §_-2S§(§_-532§) || §_-2S§(§_-i26§);
      }
      
      public function §_-x25§(param1:*) : void
      {
         if(!this._enabled)
         {
            return;
         }
         this.§_-K1n§.clear();
         if(Boolean(this.§_-w2U§) && this.§_-kz§.§_-ws§(this.§_-w2U§))
         {
            §_-s1i§.§_-z2D§.removeChild((this.§_-w2U§ as §_-v2j§).getStarlingView());
         }
         if(this.§_-w2U§ is §_-C2x§)
         {
            (this.§_-w2U§ as §_-C2x§).dispose();
         }
         if(param1 == -1 || param1 == null)
         {
            this.§_-w2U§ = null;
            Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-kG§);
            this.§_-K1n§.visible = true;
            return;
         }
         this.§_-K1n§.visible = false;
         this.§_-w2U§ = param1 is Class ? new param1() : new (§_-03s§.§_-F1T§(param1) as Class)();
         (this.§_-w2U§ as §_-h2I§).alpha = 0.5;
         if(this.§_-w2U§ is §_-8B§)
         {
            (this.§_-w2U§ as §_-8B§).showDebug = true;
         }
         if(this.§_-w2U§ is §_-E1U§)
         {
            (this.§_-w2U§ as §_-E1U§).init(this.scale);
         }
         if(this.§_-w2U§ is §_-i2t§)
         {
            (this.§_-w2U§ as §_-i2t§).init();
         }
         var _loc2_:Point = this.globalToLocal(new Point(Game.stage.mouseX,Game.stage.mouseY));
         this.§_-w2U§.position = new b2Vec2(int(_loc2_.x) / Game.§_-x2P§ / this.scale,int(_loc2_.y) / Game.§_-x2P§ / this.scale);
         this.§_-kz§.§_-83v§(this.§_-w2U§);
         this.§_-R2H§(this.§_-w2U§);
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-kG§,false,0,true);
      }
      
      override protected function get backgroundLocation() : Array
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.game is §_-A32§)
         {
            _loc1_ = (this.game as §_-A32§).§_-v1P§.§_-Vz§;
            _loc2_ = (this.game as §_-A32§).§_-v1P§.mode;
         }
         else
         {
            _loc1_ = §_-y2d§.location;
            _loc2_ = §_-y2d§.mode;
         }
         if(_loc1_ == §_-q1p§.§_-C25§)
         {
            return _loc2_ == §_-q1p§.§_-Q1Q§ ? §_-92y§.§_-q1w§(§_-q1p§.§_-w2u§) : §_-92y§.§_-q1w§(§_-q1p§.§_-C25§);
         }
         return §_-92y§.§_-q1w§(_loc1_);
      }
      
      protected function §_-AH§() : Array
      {
         if(!this.§_-H1k§)
         {
            return this.§_-u1T§;
         }
         return this.§_-H1k§.§_-A1X§();
      }
      
      private function §_-R2H§(param1:*) : void
      {
         if(!param1)
         {
            return;
         }
         param1.doubleClickEnabled = true;
      }
      
      private function set §_-c2s§(param1:Boolean) : void
      {
         if(param1 && !this.§_-WO§)
         {
            this.§_-WO§ = new §_-U2h§(this);
         }
         if(!param1 && Boolean(this.§_-WO§))
         {
            this.§_-WO§.remove();
            this.§_-WO§ = null;
         }
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(!this.§_-k6§() && !(Game.stage.focus is TextField))
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
               this.§_-K1n§.§_-y2C§();
               this.§_-x25§(null);
               break;
            case Keyboard.C:
               this.§_-x25§(§_-W1w§);
               break;
            case Keyboard.V:
               this.§_-x25§(§_-q1m§);
               break;
            case Keyboard.B:
               this.§_-x25§(§_-Mb§);
               break;
            case Keyboard.N:
               this.§_-x25§(§_-s12§);
               break;
            case Keyboard.M:
               this.§_-x25§(§_-Xx§);
               break;
            case Keyboard.S:
               this.§_-x25§(§_-31R§);
               break;
            case Keyboard.G:
               this.§_-x25§(§_-J2f§);
               break;
            case Keyboard.H:
               this.§_-x25§(§_-83t§);
               break;
            case Keyboard.COMMA:
               this.§_-x25§(§_-k1G§);
               break;
            case Keyboard.PERIOD:
               this.§_-x25§(§_-X1D§);
               break;
            case Keyboard.SLASH:
               this.§_-x25§(§_-lT§);
               break;
            case Keyboard.UP:
               if(this.§_-w2U§)
               {
                  this.§_-w2U§.angle += §_-C1a§ * Game.D2R;
               }
               break;
            case Keyboard.DOWN:
               if(this.§_-w2U§)
               {
                  this.§_-w2U§.angle -= §_-C1a§ * Game.D2R;
               }
               break;
            case Keyboard.SPACE:
               if(!(this.game as §_-A32§).§_-j1P§)
               {
                  (this.game as §_-A32§).header.§_-h2W§();
               }
         }
      }
      
      private function §_-G2D§(param1:§_-e2m§) : void
      {
         var _loc2_:Point = null;
         if(Boolean(param1 && param1.§_-n2h§) && Boolean(param1.§_-Zv§) && Boolean(this.§_-w2U§))
         {
            _loc2_ = this.globalToLocal(new Point(param1.§_-n2h§,param1.§_-Zv§));
            this.§_-w2U§.position = new b2Vec2(_loc2_.x / Game.§_-x2P§ / this.scale,_loc2_.y / Game.§_-x2P§ / this.scale);
         }
         if(this._enabled)
         {
            this.§_-v2t§(true);
         }
      }
      
      private function §_-kG§(param1:MouseEvent) : void
      {
         var _loc4_:§_-h2I§ = null;
         this.§_-K1n§.visible = true;
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-kG§);
         if(this.§_-w2U§ is §_-u2S§)
         {
            --this.§_-kX§.x;
            --this.§_-kX§.y;
            _loc4_ = this.§_-GH§(this.§_-kX§);
            if(_loc4_ is §_-l2J§)
            {
               (this.§_-w2U§ as §_-u2S§).§_-l2s§(_loc4_);
            }
            _loc4_ = null;
         }
         if(!this.§_-w2U§)
         {
            return;
         }
         (this.§_-w2U§ as §_-h2I§).alpha = 1;
         if(this.§_-w2U§ is §_-u2S§)
         {
            (this.§_-w2U§ as §_-v2j§).removeFromParent();
            this.§_-w2U§ = null;
            return;
         }
         this.add(this.§_-w2U§);
         var _loc2_:int = §_-03s§.§_-X21§(this.§_-w2U§);
         var _loc3_:Number = this.§_-w2U§.angle;
         this.§_-w2U§ = null;
         if(!param1.ctrlKey)
         {
            return;
         }
         this.§_-x25§(_loc2_);
         this.§_-w2U§.angle = _loc3_;
      }
      
      private function §_-a6§(param1:MouseEvent) : void
      {
         var _loc3_:§_-h2I§ = null;
         var _loc4_:Point = null;
         if((this.game as §_-A32§).§_-j1P§)
         {
            return;
         }
         var _loc2_:* = int(this.§_-kz§.numChildren - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.§_-kz§.§_-ek§(_loc2_--);
            _loc4_ = this.§_-kX§;
            if(!(_loc3_ is §_-u2S§) && Boolean(_loc3_.§_-iu§(_loc4_,false)))
            {
               this.§_-K1n§.§_-Hx§();
               this.§_-o12§(_loc3_);
               break;
            }
         }
      }
   }
}

