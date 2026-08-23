package §_-Rj§
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   
   public class §_-91j§ extends Sprite
   {
      
      private static const §_-Z1q§:int = 15;
      
      private static const §_-tV§:int = 40;
      
      private static const §_-l1N§:int = 5;
      
      private static const §_-g2L§:int = 10;
      
      private static const §_-r26§:int = 40;
      
      private static const §_-vq§:int = 4;
      
      private static const §_-a2y§:int = 4;
      
      private static const §_-eG§:int = 8;
      
      private static const §_-Xz§:int = -1;
      
      private static const §_-Q2W§:int = 0;
      
      private static const §_-t2I§:int = 1;
      
      private var §_-l26§:§_-A32§;
      
      private var §_-fT§:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var §_-b2T§:Dictionary = new Dictionary(true);
      
      private var §_-C1u§:Dictionary = new Dictionary(true);
      
      private var §_-Zc§:Sprite = null;
      
      private var §_-l4§:Boolean = false;
      
      private var §_-Xd§:Boolean = false;
      
      private var §_-S2l§:Boolean = false;
      
      private var §_-X1E§:int = -1;
      
      private var §_-m2Q§:int = -1;
      
      private var §_-R1h§:Number = -1;
      
      private var §_-e1o§:BitmapData;
      
      private var §_-T1O§:BitmapData;
      
      private var §_-H2i§:TextField;
      
      public function §_-91j§(param1:§_-A32§)
      {
         super();
         this.§_-l26§ = param1;
         visible = false;
         this.§_-H2i§ = new TextField();
         this.§_-H2i§.width = 100;
         this.§_-H2i§.defaultTextFormat = new TextFormat(§_-22V§.§_-F2z§,10,16777215);
      }
      
      private static function §_-g2p§(param1:Number) : Number
      {
         var _loc2_:Number = §_-tV§ * param1;
         if(_loc2_ >= §_-r26§)
         {
            return _loc2_;
         }
         var _loc3_:int = int(Math.ceil(§_-r26§ / _loc2_));
         return §_-tV§ * _loc3_ * param1;
      }
      
      private static function §_-dQ§(param1:Number) : Number
      {
         var _loc2_:Number = §_-l1N§ * param1;
         if(_loc2_ >= §_-vq§)
         {
            return _loc2_;
         }
         var _loc3_:int = int(Math.ceil(§_-vq§ / _loc2_));
         return §_-l1N§ * _loc3_ * param1;
      }
      
      public function toggle() : void
      {
         if(this.visible)
         {
            this.hide();
            return;
         }
         this.visible = true;
         this.update();
      }
      
      public function hide() : void
      {
         this.endDrag();
         this.graphics.clear();
         this.visible = false;
      }
      
      public function update() : void
      {
         var _loc6_:Sprite = null;
         var _loc1_:Point = this.§_-l26§.shift;
         var _loc2_:Number = (this.§_-l26§.map as §_-K15§).scale;
         var _loc3_:Number = §_-g2p§(_loc2_);
         var _loc4_:int = int(_loc1_.x / _loc3_);
         var _loc5_:int = int(_loc1_.y / _loc3_);
         this.graphics.clear();
         this.graphics.beginFill(0,0.15);
         this.graphics.drawRect(§_-Z1q§,0,Game.stage.fullScreenWidth - §_-Z1q§,§_-Z1q§);
         this.graphics.drawRect(0,0,§_-Z1q§,Game.stage.fullScreenHeight);
         this.graphics.endFill();
         this.§_-gO§(true,_loc1_.x,_loc2_);
         this.§_-gO§(false,_loc1_.y,_loc2_);
         if(this.§_-X1E§ != _loc4_ || this.§_-R1h§ != _loc2_)
         {
            this.§_-X1E§ = _loc4_;
            this.§_-i19§(true,_loc3_,_loc2_);
         }
         if(this.§_-m2Q§ != _loc5_ || this.§_-R1h§ != _loc2_)
         {
            this.§_-m2Q§ = _loc5_;
            this.§_-i19§(false,_loc3_,_loc2_);
         }
         this.§_-R1h§ = _loc2_;
         this.graphics.lineStyle();
         this.graphics.beginBitmapFill(this.§_-e1o§,new Matrix(1,0,0,1,_loc1_.x - _loc4_ * _loc3_,-3),true,false);
         this.graphics.drawRect(§_-Z1q§,0,Game.stage.fullScreenWidth,§_-Z1q§);
         this.graphics.lineStyle();
         this.graphics.beginBitmapFill(this.§_-T1O§,new Matrix(0,1,-1,0,0,_loc1_.y - 33 - _loc5_ * _loc3_),true,false);
         this.graphics.drawRect(0,§_-Z1q§,§_-Z1q§,Game.stage.fullScreenHeight);
         for each(_loc6_ in this.§_-fT§)
         {
            _loc6_.visible = this.visible;
            this.§_-ly§(_loc6_);
         }
      }
      
      public function §_-N2O§(param1:Point) : Boolean
      {
         if(!this.visible)
         {
            return false;
         }
         var _loc2_:int = this.§_-DC§(param1);
         if(_loc2_ == §_-Xz§)
         {
            return false;
         }
         this.§_-x15§(_loc2_ == §_-t2I§);
         return true;
      }
      
      public function §_-C29§(param1:Point) : Boolean
      {
         return this.visible && this.§_-DC§(param1) != §_-Xz§;
      }
      
      public function §_-I6§() : void
      {
         var _loc1_:Sprite = null;
         this.endDrag();
         for each(_loc1_ in this.§_-fT§)
         {
            this.§_-mW§(_loc1_,false);
         }
         this.§_-fT§.length = 0;
      }
      
      public function dispose() : void
      {
         this.hide();
         this.§_-I6§();
         if(this.§_-e1o§)
         {
            this.§_-e1o§.dispose();
            this.§_-e1o§ = null;
         }
         if(this.§_-T1O§)
         {
            this.§_-T1O§.dispose();
            this.§_-T1O§ = null;
         }
         this.§_-H2i§ = null;
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         this.§_-fT§ = null;
         this.§_-b2T§ = null;
         this.§_-C1u§ = null;
         this.§_-l26§ = null;
      }
      
      private function §_-31B§(param1:Boolean, param2:Number, param3:Number) : void
      {
         var _loc4_:Sprite = new Sprite();
         _loc4_.buttonMode = true;
         _loc4_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Z20§);
         addChild(_loc4_);
         this.§_-fT§.push(_loc4_);
         this.§_-b2T§[_loc4_] = param1;
         _loc4_.visible = this.visible;
         this.§_-8a§(_loc4_,new Point(param2,param3));
         this.§_-ly§(_loc4_);
         this.§_-W1z§(_loc4_,false);
      }
      
      private function §_-gO§(param1:Boolean, param2:Number, param3:Number) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:int = param1 ? int(Game.stage.fullScreenWidth) : int(Game.stage.fullScreenHeight);
         var _loc5_:Number = §_-dQ§(param3);
         var _loc6_:Number = param2 % _loc5_;
         if(_loc6_ < 0)
         {
            _loc6_ += _loc5_;
         }
         this.graphics.lineStyle(1,16777215,0.5);
         var _loc7_:Number = _loc6_;
         while(_loc7_ < _loc4_)
         {
            _loc8_ = Math.round((_loc7_ - param2) / param3 / §_-l1N§) * §_-l1N§;
            _loc9_ = this.§_-pf§(_loc8_);
            if(param1)
            {
               if(_loc7_ >= §_-Z1q§)
               {
                  this.graphics.moveTo(_loc7_,§_-Z1q§);
                  this.graphics.lineTo(_loc7_,§_-Z1q§ - _loc9_);
               }
            }
            else if(_loc7_ >= §_-Z1q§)
            {
               this.graphics.moveTo(§_-Z1q§,_loc7_);
               this.graphics.lineTo(§_-Z1q§ - _loc9_,_loc7_);
            }
            _loc7_ += _loc5_;
         }
      }
      
      private function §_-pf§(param1:int) : int
      {
         if(param1 % §_-tV§ == 0)
         {
            return §_-Z1q§;
         }
         if(param1 % §_-g2L§ == 0)
         {
            return §_-eG§;
         }
         return §_-a2y§;
      }
      
      private function §_-mW§(param1:Sprite, param2:Boolean = true) : void
      {
         param1.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Z20§);
         delete this.§_-b2T§[param1];
         delete this.§_-C1u§[param1];
         if(this.§_-Zc§ == param1)
         {
            this.endDrag();
         }
         if(param1.parent)
         {
            param1.parent.removeChild(param1);
         }
         if(!param2)
         {
            return;
         }
         var _loc3_:int = this.§_-fT§.indexOf(param1);
         if(_loc3_ >= 0)
         {
            this.§_-fT§.splice(_loc3_,1);
         }
      }
      
      private function §_-i19§(param1:Boolean, param2:Number, param3:Number) : void
      {
         var _loc4_:int = param1 ? this.§_-X1E§ : this.§_-m2Q§;
         var _loc5_:int = int(param2);
         var _loc6_:int = param1 ? int(Game.stage.fullScreenWidth) : int(Game.stage.fullScreenHeight);
         var _loc7_:BitmapData = param1 ? this.§_-e1o§ : this.§_-T1O§;
         if(_loc7_)
         {
            _loc7_.dispose();
         }
         _loc7_ = new BitmapData(_loc6_ + _loc5_,§_-Z1q§,true,16777215);
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_ + _loc5_)
         {
            this.§_-H2i§.text = String(int((_loc8_ - _loc4_ * _loc5_) / param3));
            _loc7_.draw(this.§_-H2i§,new Matrix(1,0,0,1,_loc8_,0));
            _loc8_ += _loc5_;
         }
         if(param1)
         {
            this.§_-e1o§ = _loc7_;
         }
         else
         {
            this.§_-T1O§ = _loc7_;
         }
      }
      
      private function §_-Z20§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         this.§_-W1z§(param1.currentTarget as Sprite,true);
      }
      
      private function §_-x15§(param1:Boolean) : void
      {
         this.endDrag();
         this.§_-Xd§ = true;
         this.§_-S2l§ = param1;
         this.§_-BC§(true);
      }
      
      private function §_-W1z§(param1:Sprite, param2:Boolean) : void
      {
         if(this.§_-Zc§ == param1)
         {
            return;
         }
         this.endDrag();
         this.§_-Zc§ = param1;
         this.§_-l4§ = param2;
         this.§_-BC§(true);
      }
      
      private function endDrag() : void
      {
         if(!this.§_-Zc§ && !this.§_-Xd§)
         {
            return;
         }
         this.§_-Zc§ = null;
         this.§_-l4§ = false;
         this.§_-Xd§ = false;
         this.§_-BC§(false);
      }
      
      private function §_-BC§(param1:Boolean) : void
      {
         if(param1)
         {
            Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-PF§);
            Game.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-d2V§);
            return;
         }
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-PF§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-d2V§);
      }
      
      private function §_-PF§(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.§_-d2V§(param1);
            return;
         }
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         if(this.§_-Xd§)
         {
            if(this.§_-DC§(_loc2_) == §_-Xz§)
            {
               this.§_-31B§(this.§_-S2l§,_loc2_.x,_loc2_.y);
            }
            return;
         }
         if(!this.§_-Zc§)
         {
            return;
         }
         this.§_-8a§(this.§_-Zc§,_loc2_);
         this.§_-ly§(this.§_-Zc§);
      }
      
      private function §_-d2V§(param1:MouseEvent) : void
      {
         if(this.§_-Xd§)
         {
            this.endDrag();
            return;
         }
         if(!this.§_-Zc§)
         {
            return;
         }
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         if(this.§_-l4§ && this.§_-DC§(_loc2_) != §_-Xz§ || this.§_-w1U§(this.§_-Zc§))
         {
            this.§_-mW§(this.§_-Zc§);
            return;
         }
         this.endDrag();
      }
      
      private function §_-DC§(param1:Point) : int
      {
         var _loc2_:Point = globalToLocal(param1);
         if(_loc2_.y >= 0 && _loc2_.y <= §_-Z1q§ && _loc2_.x >= §_-Z1q§)
         {
            return §_-Q2W§;
         }
         if(_loc2_.x >= 0 && _loc2_.x <= §_-Z1q§ && _loc2_.y >= §_-Z1q§)
         {
            return §_-t2I§;
         }
         return §_-Xz§;
      }
      
      private function §_-w1U§(param1:Sprite) : Boolean
      {
         if(this.§_-b2T§[param1])
         {
            return param1.x < §_-Z1q§ || param1.x > Game.stage.fullScreenWidth;
         }
         return param1.y < §_-Z1q§ || param1.y > Game.stage.fullScreenHeight;
      }
      
      private function §_-8a§(param1:Sprite, param2:Point) : void
      {
         var _loc3_:Point = this.§_-l26§.globalToLocal(param2);
         var _loc4_:Point = this.§_-l26§.shift;
         var _loc5_:Number = (this.§_-l26§.map as §_-K15§).scale;
         this.§_-C1u§[param1] = this.§_-b2T§[param1] ? (_loc3_.x - _loc4_.x) / _loc5_ : (_loc3_.y - _loc4_.y) / _loc5_;
      }
      
      private function §_-ly§(param1:Sprite) : void
      {
         var _loc2_:Boolean = Boolean(this.§_-b2T§[param1]);
         var _loc3_:Number = Number(this.§_-C1u§[param1]);
         var _loc4_:Point = this.§_-l26§.shift;
         var _loc5_:Number = (this.§_-l26§.map as §_-K15§).scale;
         param1.graphics.clear();
         this.§_-lA§(param1,_loc2_);
         if(_loc2_)
         {
            param1.x = _loc4_.x + _loc3_ * _loc5_ - this.x;
         }
         else
         {
            param1.y = _loc4_.y + _loc3_ * _loc5_ - this.y;
         }
      }
      
      private function §_-lA§(param1:Sprite, param2:Boolean) : void
      {
         this.§_-el§(param1,param2,3,0,0.1);
         this.§_-el§(param1,param2,1,16777215);
      }
      
      private function §_-el§(param1:Sprite, param2:Boolean, param3:int, param4:uint, param5:Number = 1) : void
      {
         param1.graphics.lineStyle(param3,param4,param5);
         param1.graphics.moveTo(0,0);
         if(param2)
         {
            param1.graphics.lineTo(0,Game.stage.fullScreenHeight);
         }
         else
         {
            param1.graphics.lineTo(Game.stage.fullScreenWidth,0);
         }
      }
   }
}

