package §_-l2u§
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   
   public class §_-aN§ extends Sprite
   {
      
      private static const §_-D1B§:int = 15;
      
      private static const §_-r1s§:int = 40;
      
      private static const §_-CF§:int = 5;
      
      private static const §_-n2Z§:int = 10;
      
      private static const §_-m4§:int = 40;
      
      private static const §_-f7§:int = 4;
      
      private static const §_-z1f§:int = 4;
      
      private static const §_-rS§:int = 8;
      
      private static const §_-a2P§:int = -1;
      
      private static const §_-125§:int = 0;
      
      private static const §_-h1p§:int = 1;
      
      private var §_-E1v§:§_-62b§;
      
      private var §_-SG§:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var §_-d1§:Dictionary = new Dictionary(true);
      
      private var §_-B3h§:Dictionary = new Dictionary(true);
      
      private var §_-138§:Sprite = null;
      
      private var §_-V1B§:Boolean = false;
      
      private var §_-1p§:Boolean = false;
      
      private var §_-M1T§:Boolean = false;
      
      private var §_-T11§:int = -1;
      
      private var §_-43P§:int = -1;
      
      private var §_-mE§:Number = -1;
      
      private var §_-Nt§:BitmapData;
      
      private var §_-yV§:BitmapData;
      
      private var §_-e1G§:TextField;
      
      public function §_-aN§(param1:§_-62b§)
      {
         super();
         this.§_-E1v§ = param1;
         visible = false;
         this.§_-e1G§ = new TextField();
         this.§_-e1G§.width = 100;
         this.§_-e1G§.defaultTextFormat = new TextFormat(§_-i5§.§_-c10§,10,16777215);
      }
      
      private static function §_-89§(param1:Number) : Number
      {
         var _loc2_:Number = §_-r1s§ * param1;
         if(_loc2_ >= §_-m4§)
         {
            return _loc2_;
         }
         var _loc3_:int = int(Math.ceil(§_-m4§ / _loc2_));
         return §_-r1s§ * _loc3_ * param1;
      }
      
      private static function §_-Dt§(param1:Number) : Number
      {
         var _loc2_:Number = §_-CF§ * param1;
         if(_loc2_ >= §_-f7§)
         {
            return _loc2_;
         }
         var _loc3_:int = int(Math.ceil(§_-f7§ / _loc2_));
         return §_-CF§ * _loc3_ * param1;
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
         var _loc1_:Point = this.§_-E1v§.shift;
         var _loc2_:Number = (this.§_-E1v§.map as §_-53A§).scale;
         var _loc3_:Number = §_-89§(_loc2_);
         var _loc4_:int = int(_loc1_.x / _loc3_);
         var _loc5_:int = int(_loc1_.y / _loc3_);
         this.graphics.clear();
         this.graphics.beginFill(0,0.15);
         this.graphics.drawRect(§_-D1B§,0,Game.stage.fullScreenWidth - §_-D1B§,§_-D1B§);
         this.graphics.drawRect(0,0,§_-D1B§,Game.stage.fullScreenHeight);
         this.graphics.endFill();
         this.§_-t1G§(true,_loc1_.x,_loc2_);
         this.§_-t1G§(false,_loc1_.y,_loc2_);
         if(this.§_-T11§ != _loc4_ || this.§_-mE§ != _loc2_)
         {
            this.§_-T11§ = _loc4_;
            this.§_-Qr§(true,_loc3_,_loc2_);
         }
         if(this.§_-43P§ != _loc5_ || this.§_-mE§ != _loc2_)
         {
            this.§_-43P§ = _loc5_;
            this.§_-Qr§(false,_loc3_,_loc2_);
         }
         this.§_-mE§ = _loc2_;
         this.graphics.lineStyle();
         this.graphics.beginBitmapFill(this.§_-Nt§,new Matrix(1,0,0,1,_loc1_.x - _loc4_ * _loc3_,-3),true,false);
         this.graphics.drawRect(§_-D1B§,0,Game.stage.fullScreenWidth,§_-D1B§);
         this.graphics.lineStyle();
         this.graphics.beginBitmapFill(this.§_-yV§,new Matrix(0,1,-1,0,0,_loc1_.y - 33 - _loc5_ * _loc3_),true,false);
         this.graphics.drawRect(0,§_-D1B§,§_-D1B§,Game.stage.fullScreenHeight);
         for each(_loc6_ in this.§_-SG§)
         {
            _loc6_.visible = this.visible;
            this.§_-926§(_loc6_);
         }
      }
      
      public function §_-eG§(param1:Point) : Boolean
      {
         if(!this.visible)
         {
            return false;
         }
         var _loc2_:int = this.§_-92E§(param1);
         if(_loc2_ == §_-a2P§)
         {
            return false;
         }
         this.§_-Z1v§(_loc2_ == §_-h1p§);
         return true;
      }
      
      public function §_-w2x§(param1:Point) : Boolean
      {
         return this.visible && this.§_-92E§(param1) != §_-a2P§;
      }
      
      public function §_-Jj§() : void
      {
         var _loc1_:Sprite = null;
         this.endDrag();
         for each(_loc1_ in this.§_-SG§)
         {
            this.§_-hT§(_loc1_,false);
         }
         this.§_-SG§.length = 0;
      }
      
      public function dispose() : void
      {
         this.hide();
         this.§_-Jj§();
         if(this.§_-Nt§)
         {
            this.§_-Nt§.dispose();
            this.§_-Nt§ = null;
         }
         if(this.§_-yV§)
         {
            this.§_-yV§.dispose();
            this.§_-yV§ = null;
         }
         this.§_-e1G§ = null;
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         this.§_-SG§ = null;
         this.§_-d1§ = null;
         this.§_-B3h§ = null;
         this.§_-E1v§ = null;
      }
      
      private function §_-Z2E§(param1:Boolean, param2:Number, param3:Number) : void
      {
         var _loc4_:Sprite = new Sprite();
         _loc4_.buttonMode = true;
         _loc4_.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-JO§);
         addChild(_loc4_);
         this.§_-SG§.push(_loc4_);
         this.§_-d1§[_loc4_] = param1;
         _loc4_.visible = this.visible;
         this.§_-U2w§(_loc4_,new Point(param2,param3));
         this.§_-926§(_loc4_);
         this.§_-P1k§(_loc4_,false);
      }
      
      private function §_-t1G§(param1:Boolean, param2:Number, param3:Number) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:int = param1 ? int(Game.stage.fullScreenWidth) : int(Game.stage.fullScreenHeight);
         var _loc5_:Number = §_-Dt§(param3);
         var _loc6_:Number = param2 % _loc5_;
         if(_loc6_ < 0)
         {
            _loc6_ += _loc5_;
         }
         this.graphics.lineStyle(1,16777215,0.5);
         var _loc7_:Number = _loc6_;
         while(_loc7_ < _loc4_)
         {
            _loc8_ = Math.round((_loc7_ - param2) / param3 / §_-CF§) * §_-CF§;
            _loc9_ = this.§_-E2o§(_loc8_);
            if(param1)
            {
               if(_loc7_ >= §_-D1B§)
               {
                  this.graphics.moveTo(_loc7_,§_-D1B§);
                  this.graphics.lineTo(_loc7_,§_-D1B§ - _loc9_);
               }
            }
            else if(_loc7_ >= §_-D1B§)
            {
               this.graphics.moveTo(§_-D1B§,_loc7_);
               this.graphics.lineTo(§_-D1B§ - _loc9_,_loc7_);
            }
            _loc7_ += _loc5_;
         }
      }
      
      private function §_-E2o§(param1:int) : int
      {
         if(param1 % §_-r1s§ == 0)
         {
            return §_-D1B§;
         }
         if(param1 % §_-n2Z§ == 0)
         {
            return §_-rS§;
         }
         return §_-z1f§;
      }
      
      private function §_-hT§(param1:Sprite, param2:Boolean = true) : void
      {
         param1.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-JO§);
         delete this.§_-d1§[param1];
         delete this.§_-B3h§[param1];
         if(this.§_-138§ == param1)
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
         var _loc3_:int = this.§_-SG§.indexOf(param1);
         if(_loc3_ >= 0)
         {
            this.§_-SG§.splice(_loc3_,1);
         }
      }
      
      private function §_-Qr§(param1:Boolean, param2:Number, param3:Number) : void
      {
         var _loc4_:int = param1 ? this.§_-T11§ : this.§_-43P§;
         var _loc5_:int = int(param2);
         var _loc6_:int = param1 ? int(Game.stage.fullScreenWidth) : int(Game.stage.fullScreenHeight);
         var _loc7_:BitmapData = param1 ? this.§_-Nt§ : this.§_-yV§;
         if(_loc7_)
         {
            _loc7_.dispose();
         }
         _loc7_ = new BitmapData(_loc6_ + _loc5_,§_-D1B§,true,16777215);
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_ + _loc5_)
         {
            this.§_-e1G§.text = String(int((_loc8_ - _loc4_ * _loc5_) / param3));
            _loc7_.draw(this.§_-e1G§,new Matrix(1,0,0,1,_loc8_,0));
            _loc8_ += _loc5_;
         }
         if(param1)
         {
            this.§_-Nt§ = _loc7_;
         }
         else
         {
            this.§_-yV§ = _loc7_;
         }
      }
      
      private function §_-JO§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         this.§_-P1k§(param1.currentTarget as Sprite,true);
      }
      
      private function §_-Z1v§(param1:Boolean) : void
      {
         this.endDrag();
         this.§_-1p§ = true;
         this.§_-M1T§ = param1;
         this.§_-81h§(true);
      }
      
      private function §_-P1k§(param1:Sprite, param2:Boolean) : void
      {
         if(this.§_-138§ == param1)
         {
            return;
         }
         this.endDrag();
         this.§_-138§ = param1;
         this.§_-V1B§ = param2;
         this.§_-81h§(true);
      }
      
      private function endDrag() : void
      {
         if(!this.§_-138§ && !this.§_-1p§)
         {
            return;
         }
         this.§_-138§ = null;
         this.§_-V1B§ = false;
         this.§_-1p§ = false;
         this.§_-81h§(false);
      }
      
      private function §_-81h§(param1:Boolean) : void
      {
         if(param1)
         {
            Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-Kg§);
            Game.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-83u§);
            return;
         }
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-Kg§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-83u§);
      }
      
      private function §_-Kg§(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.§_-83u§(param1);
            return;
         }
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         if(this.§_-1p§)
         {
            if(this.§_-92E§(_loc2_) == §_-a2P§)
            {
               this.§_-Z2E§(this.§_-M1T§,_loc2_.x,_loc2_.y);
            }
            return;
         }
         if(!this.§_-138§)
         {
            return;
         }
         this.§_-U2w§(this.§_-138§,_loc2_);
         this.§_-926§(this.§_-138§);
      }
      
      private function §_-83u§(param1:MouseEvent) : void
      {
         if(this.§_-1p§)
         {
            this.endDrag();
            return;
         }
         if(!this.§_-138§)
         {
            return;
         }
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         if(this.§_-V1B§ && this.§_-92E§(_loc2_) != §_-a2P§ || this.§_-830§(this.§_-138§))
         {
            this.§_-hT§(this.§_-138§);
            return;
         }
         this.endDrag();
      }
      
      private function §_-92E§(param1:Point) : int
      {
         var _loc2_:Point = globalToLocal(param1);
         if(_loc2_.y >= 0 && _loc2_.y <= §_-D1B§ && _loc2_.x >= §_-D1B§)
         {
            return §_-125§;
         }
         if(_loc2_.x >= 0 && _loc2_.x <= §_-D1B§ && _loc2_.y >= §_-D1B§)
         {
            return §_-h1p§;
         }
         return §_-a2P§;
      }
      
      private function §_-830§(param1:Sprite) : Boolean
      {
         if(this.§_-d1§[param1])
         {
            return param1.x < §_-D1B§ || param1.x > Game.stage.fullScreenWidth;
         }
         return param1.y < §_-D1B§ || param1.y > Game.stage.fullScreenHeight;
      }
      
      private function §_-U2w§(param1:Sprite, param2:Point) : void
      {
         var _loc3_:Point = this.§_-E1v§.globalToLocal(param2);
         var _loc4_:Point = this.§_-E1v§.shift;
         var _loc5_:Number = (this.§_-E1v§.map as §_-53A§).scale;
         this.§_-B3h§[param1] = this.§_-d1§[param1] ? (_loc3_.x - _loc4_.x) / _loc5_ : (_loc3_.y - _loc4_.y) / _loc5_;
      }
      
      private function §_-926§(param1:Sprite) : void
      {
         var _loc2_:Boolean = Boolean(this.§_-d1§[param1]);
         var _loc3_:Number = Number(this.§_-B3h§[param1]);
         var _loc4_:Point = this.§_-E1v§.shift;
         var _loc5_:Number = (this.§_-E1v§.map as §_-53A§).scale;
         param1.graphics.clear();
         this.§_-B1E§(param1,_loc2_);
         if(_loc2_)
         {
            param1.x = _loc4_.x + _loc3_ * _loc5_ - this.x;
         }
         else
         {
            param1.y = _loc4_.y + _loc3_ * _loc5_ - this.y;
         }
      }
      
      private function §_-B1E§(param1:Sprite, param2:Boolean) : void
      {
         this.§_-b4§(param1,param2,3,0,0.1);
         this.§_-b4§(param1,param2,1,16777215);
      }
      
      private function §_-b4§(param1:Sprite, param2:Boolean, param3:int, param4:uint, param5:Number = 1) : void
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

