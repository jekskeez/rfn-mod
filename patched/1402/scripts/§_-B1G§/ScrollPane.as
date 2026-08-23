package §_-B1G§
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class ScrollPane extends Sprite
   {
      
      public static const §_-gP§:int = 8;
      
      private static const §_-zd§:int = 30;
      
      private static const §_-r2L§:int = 20;
      
      private static const §_-82Z§:uint = 15261912;
      
      private static const §_-g2e§:uint = 12891552;
      
      private static const §_-P2n§:int = 3;
      
      private static const §_-Ym§:Number = 3;
      
      private var §_-A1i§:Sprite;
      
      private var content:DisplayObject;
      
      private var §_-ro§:int = 100;
      
      private var §_-S1h§:int = 100;
      
      private var §_-u1c§:int;
      
      private var §_-H1w§:int = 30;
      
      private var §_-A3s§:int = 30;
      
      private var §_-F11§:uint = 15261912;
      
      private var §_-D2E§:uint = 12891552;
      
      private var §_-S1O§:Number = 1;
      
      private var §_-b29§:Number = 1;
      
      private var §_-E21§:int = 0;
      
      private var §_-JL§:int = 0;
      
      private var §_-c2Y§:int = 0;
      
      private var §_-91u§:int = 0;
      
      private var §_-51Q§:Sprite;
      
      private var §_-n1l§:Sprite;
      
      private var §_-U1F§:Sprite;
      
      private var §_-32x§:Number = 0;
      
      private var §_-31k§:Boolean = false;
      
      private var §_-83k§:Sprite;
      
      private var §_-I2A§:Sprite;
      
      private var §_-31W§:Sprite;
      
      private var §_-a0§:Number = 0;
      
      private var §_-w2d§:Boolean = false;
      
      private var §_-5J§:Number = 0;
      
      private var §_-og§:Number = 0;
      
      private var §_-A2i§:int = 0;
      
      private var §_-u3§:int = 0;
      
      private var §_-020§:Boolean = false;
      
      private var §_-u2B§:Boolean = false;
      
      private var §_-Xu§:Boolean = false;
      
      public function ScrollPane(param1:int = 8)
      {
         super();
         this.§_-u1c§ = param1;
         this.§_-A1i§ = new Sprite();
         this.§_-A1i§.scrollRect = new Rectangle(0,0,this.§_-ro§,this.§_-S1h§);
         this.§_-61G§();
         addChild(this.§_-A1i§);
         this.§_-u5§();
         addEventListener(MouseEvent.MOUSE_WHEEL,this.§_-U2t§,false,0,true);
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-W1B§,false,0,true);
         addEventListener(Event.ADDED_TO_STAGE,this.§_-Ua§,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-4R§,false,0,true);
         this.§_-k2K§();
         this.§_-w1t§();
      }
      
      override public function get width() : Number
      {
         return this.§_-ro§;
      }
      
      override public function set width(param1:Number) : void
      {
         this.setSize(int(param1),this.§_-S1h§);
      }
      
      override public function get height() : Number
      {
         return this.§_-S1h§;
      }
      
      override public function set height(param1:Number) : void
      {
         this.setSize(this.§_-ro§,int(param1));
      }
      
      public function get source() : DisplayObject
      {
         return this.content;
      }
      
      public function set source(param1:DisplayObject) : void
      {
         if(Boolean(this.content) && this.content.parent == this.§_-A1i§)
         {
            this.§_-A1i§.removeChild(this.content);
         }
         this.content = param1;
         if(this.content)
         {
            this.§_-A1i§.addChildAt(this.content,0);
         }
         this.update();
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         param1 = Math.max(0,param1);
         param2 = Math.max(0,param2);
         if(this.§_-ro§ == param1 && this.§_-S1h§ == param2)
         {
            return;
         }
         this.§_-ro§ = param1;
         this.§_-S1h§ = param2;
         this.§_-A1i§.scrollRect = new Rectangle(0,0,param1,param2);
         this.§_-61G§();
         this.§_-51Q§.x = param1 - this.§_-u1c§;
         this.§_-83k§.y = param2 - this.§_-u1c§;
         this.§_-k2K§();
         this.§_-d2M§(this.§_-c2Y§,this.§_-91u§);
      }
      
      public function §_-i1W§(param1:uint, param2:Number = 1) : void
      {
         this.§_-F11§ = param1;
         this.§_-S1O§ = param2;
         this.§_-k2K§();
      }
      
      public function §_-sO§(param1:uint, param2:Number = 1) : void
      {
         this.§_-D2E§ = param1;
         this.§_-b29§ = param2;
         this.§_-k2K§();
      }
      
      public function update() : void
      {
         var _loc1_:Rectangle = null;
         if(this.content)
         {
            _loc1_ = this.content.getRect(this.content);
            this.§_-E21§ = Math.max(0,Math.ceil(_loc1_.right));
            this.§_-JL§ = Math.max(0,Math.ceil(_loc1_.bottom));
         }
         else
         {
            this.§_-E21§ = 0;
            this.§_-JL§ = 0;
         }
         this.§_-d2M§(this.§_-c2Y§,this.§_-91u§);
         this.§_-k2K§();
         this.§_-w1t§();
      }
      
      public function get verticalScrollPosition() : Number
      {
         return this.§_-91u§;
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         this.§_-d2M§(this.§_-c2Y§,int(param1));
      }
      
      public function get horizontalScrollPosition() : Number
      {
         return this.§_-c2Y§;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         this.§_-d2M§(int(param1),this.§_-91u§);
      }
      
      public function get maxVerticalScrollPosition() : Number
      {
         return this.§_-83D§();
      }
      
      public function get maxHorizontalScrollPosition() : Number
      {
         return this.§_-O1x§();
      }
      
      public function get verticalLineScrollSize() : Number
      {
         return this.§_-A3s§;
      }
      
      public function set verticalLineScrollSize(param1:Number) : void
      {
         this.§_-A3s§ = int(param1);
      }
      
      public function get horizontalLineScrollSize() : Number
      {
         return this.§_-H1w§;
      }
      
      public function set horizontalLineScrollSize(param1:Number) : void
      {
         this.§_-H1w§ = int(param1);
      }
      
      public function dispose() : void
      {
         this.§_-41b§();
         this.§_-VH§();
         this.§_-WY§();
         this.§_-yj§();
         removeEventListener(MouseEvent.MOUSE_WHEEL,this.§_-U2t§);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-W1B§);
         removeEventListener(Event.ADDED_TO_STAGE,this.§_-Ua§);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-4R§);
         this.§_-P1a§(this.§_-51Q§,this.§_-n1l§,this.§_-U1F§,this.§_-31g§,this.§_-s1U§);
         this.§_-P1a§(this.§_-83k§,this.§_-I2A§,this.§_-31W§,this.§_-C6§,this.§_-tG§);
         this.§_-51Q§ = this.§_-n1l§ = this.§_-U1F§ = null;
         this.§_-83k§ = this.§_-I2A§ = this.§_-31W§ = null;
         this.content = null;
      }
      
      private function §_-P1a§(param1:Sprite, param2:Sprite, param3:Sprite, param4:Function, param5:Function) : void
      {
         if(!param1)
         {
            return;
         }
         param2.removeEventListener(MouseEvent.MOUSE_DOWN,param4);
         param3.removeEventListener(MouseEvent.MOUSE_DOWN,param5);
         if(param1.parent)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      private function §_-X1n§() : Boolean
      {
         return this.§_-JL§ > this.§_-S1h§;
      }
      
      private function §_-b1d§() : Boolean
      {
         return this.§_-E21§ > this.§_-ro§;
      }
      
      private function §_-O1x§() : int
      {
         return Math.max(0,this.§_-E21§ - this.§_-ro§);
      }
      
      private function §_-83D§() : int
      {
         return Math.max(0,this.§_-JL§ - this.§_-S1h§);
      }
      
      private function §_-lv§() : int
      {
         return this.§_-S1h§ - (this.§_-b1d§() ? this.§_-u1c§ : 0);
      }
      
      private function §_-Nw§() : int
      {
         return this.§_-ro§ - (this.§_-X1n§() ? this.§_-u1c§ : 0);
      }
      
      private function §_-d2M§(param1:int, param2:int) : void
      {
         var _loc3_:int = Math.max(0,Math.min(param1,this.§_-O1x§()));
         var _loc4_:int = Math.max(0,Math.min(param2,this.§_-83D§()));
         var _loc5_:Boolean = _loc3_ != this.§_-c2Y§ || _loc4_ != this.§_-91u§;
         this.§_-c2Y§ = _loc3_;
         this.§_-91u§ = _loc4_;
         if(this.content)
         {
            this.content.x = -_loc3_;
            this.content.y = -_loc4_;
         }
         this.§_-21x§();
         if(_loc5_)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function §_-u5§() : void
      {
         this.§_-51Q§ = new Sprite();
         this.§_-51Q§.x = this.§_-ro§ - this.§_-u1c§;
         this.§_-n1l§ = new Sprite();
         this.§_-n1l§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31g§,false,0,true);
         this.§_-51Q§.addChild(this.§_-n1l§);
         this.§_-U1F§ = new Sprite();
         this.§_-U1F§.buttonMode = true;
         this.§_-U1F§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-s1U§,false,0,true);
         this.§_-51Q§.addChild(this.§_-U1F§);
         addChild(this.§_-51Q§);
         this.§_-83k§ = new Sprite();
         this.§_-83k§.y = this.§_-S1h§ - this.§_-u1c§;
         this.§_-I2A§ = new Sprite();
         this.§_-I2A§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-C6§,false,0,true);
         this.§_-83k§.addChild(this.§_-I2A§);
         this.§_-31W§ = new Sprite();
         this.§_-31W§.buttonMode = true;
         this.§_-31W§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-tG§,false,0,true);
         this.§_-83k§.addChild(this.§_-31W§);
         addChild(this.§_-83k§);
      }
      
      private function §_-k2K§() : void
      {
         if(!this.§_-51Q§)
         {
            return;
         }
         this.§_-51Q§.mouseEnabled = this.§_-51Q§.mouseChildren = this.§_-X1n§();
         this.§_-n1l§.graphics.clear();
         this.§_-n1l§.graphics.beginFill(this.§_-F11§,this.§_-S1O§);
         this.§_-n1l§.graphics.drawRect(0,0,this.§_-u1c§,this.§_-lv§());
         this.§_-n1l§.graphics.endFill();
         this.§_-83k§.mouseEnabled = this.§_-83k§.mouseChildren = this.§_-b1d§();
         this.§_-I2A§.graphics.clear();
         this.§_-I2A§.graphics.beginFill(this.§_-F11§,this.§_-S1O§);
         this.§_-I2A§.graphics.drawRect(0,0,this.§_-Nw§(),this.§_-u1c§);
         this.§_-I2A§.graphics.endFill();
         this.§_-21x§();
      }
      
      private function §_-61G§() : void
      {
         this.§_-A1i§.graphics.clear();
         this.§_-A1i§.graphics.beginFill(0,0);
         this.§_-A1i§.graphics.drawRect(0,0,this.§_-ro§,this.§_-S1h§);
         this.§_-A1i§.graphics.endFill();
      }
      
      private function §_-21x§() : void
      {
         if(!this.§_-51Q§)
         {
            return;
         }
         this.§_-U1F§.graphics.clear();
         if(this.§_-X1n§())
         {
            this.§_-U1F§.graphics.beginFill(this.§_-D2E§,this.§_-b29§);
            this.§_-U1F§.graphics.drawRoundRect(1,this.§_-s2R§(),this.§_-u1c§ - 2,this.§_-73N§(),§_-P2n§);
            this.§_-U1F§.graphics.endFill();
         }
         this.§_-31W§.graphics.clear();
         if(this.§_-b1d§())
         {
            this.§_-31W§.graphics.beginFill(this.§_-D2E§,this.§_-b29§);
            this.§_-31W§.graphics.drawRoundRect(this.§_-A1f§(),1,this.§_-w1V§(),this.§_-u1c§ - 2,§_-P2n§);
            this.§_-31W§.graphics.endFill();
         }
      }
      
      private function §_-73N§() : int
      {
         return Math.max(§_-r2L§,int(this.§_-lv§() * this.§_-S1h§ / this.§_-JL§));
      }
      
      private function §_-s2R§() : int
      {
         if(this.§_-83D§() == 0)
         {
            return 0;
         }
         return int(this.§_-91u§ / this.§_-83D§() * (this.§_-lv§() - this.§_-73N§()));
      }
      
      private function §_-w1V§() : int
      {
         return Math.max(§_-r2L§,int(this.§_-Nw§() * this.§_-ro§ / this.§_-E21§));
      }
      
      private function §_-A1f§() : int
      {
         if(this.§_-O1x§() == 0)
         {
            return 0;
         }
         return int(this.§_-c2Y§ / this.§_-O1x§() * (this.§_-Nw§() - this.§_-w1V§()));
      }
      
      private function §_-L1p§(param1:DisplayObject) : Boolean
      {
         if(!param1 || !this.§_-51Q§)
         {
            return false;
         }
         return param1 == this.§_-51Q§ || this.§_-51Q§.contains(param1) || param1 == this.§_-83k§ || this.§_-83k§.contains(param1);
      }
      
      private function §_-w1t§() : void
      {
         if(!this.§_-51Q§)
         {
            return;
         }
         var _loc1_:Boolean = this.§_-Xu§ || this.§_-020§ || this.§_-31k§ || this.§_-w2d§;
         this.§_-51Q§.visible = this.§_-X1n§() && _loc1_;
         this.§_-83k§.visible = this.§_-b1d§() && _loc1_;
      }
      
      private function §_-U2t§(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§_-f1J§(param1.stageX,param1.stageY))
         {
            return;
         }
         if(!this.§_-X1n§() && !this.§_-b1d§())
         {
            return;
         }
         param1.preventDefault();
         param1.stopPropagation();
         if(param1.shiftKey || !this.§_-X1n§() && this.§_-b1d§())
         {
            _loc2_ = param1.delta > 0 ? int(-this.§_-H1w§) : this.§_-H1w§;
            this.§_-d2M§(this.§_-c2Y§ + _loc2_,this.§_-91u§);
         }
         else
         {
            _loc3_ = param1.delta > 0 ? int(-this.§_-A3s§) : this.§_-A3s§;
            this.§_-d2M§(this.§_-c2Y§,this.§_-91u§ + _loc3_);
         }
      }
      
      private function §_-323§() : void
      {
         if(!this.stage)
         {
            return;
         }
         this.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-f12§,true,0,true);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-Kg§,true,0,true);
      }
      
      private function §_-yj§() : void
      {
         if(!this.stage)
         {
            return;
         }
         this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-f12§,true);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-Kg§,true);
         this.§_-n21§();
      }
      
      private function §_-Ua§(param1:Event) : void
      {
         this.§_-323§();
         this.§_-w1t§();
      }
      
      private function §_-4R§(param1:Event) : void
      {
         this.§_-41b§();
         this.§_-VH§();
         this.§_-WY§();
         this.§_-yj§();
         this.§_-Xu§ = false;
         this.§_-w1t§();
      }
      
      private function §_-W1B§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
      }
      
      private function §_-V2g§(param1:DisplayObject) : Boolean
      {
         var _loc2_:TextField = null;
         while(Boolean(param1) && param1 != this)
         {
            if(param1 is TextField)
            {
               _loc2_ = param1 as TextField;
               if(_loc2_.type == TextFieldType.INPUT || _loc2_.selectable)
               {
                  return true;
               }
            }
            param1 = param1.parent;
         }
         return false;
      }
      
      private function §_-f12§(param1:MouseEvent) : void
      {
         if(this.§_-020§ || this.§_-31k§ || this.§_-w2d§)
         {
            return;
         }
         if(!this.§_-X1n§() && !this.§_-b1d§())
         {
            return;
         }
         if(this.§_-L1p§(param1.target as DisplayObject))
         {
            return;
         }
         if(!this.§_-R7§(param1.stageX,param1.stageY))
         {
            return;
         }
         if(this.§_-f1J§(param1.stageX,param1.stageY))
         {
            return;
         }
         if(this.§_-V2g§(param1.target as DisplayObject))
         {
            return;
         }
         this.§_-5J§ = param1.stageX;
         this.§_-og§ = param1.stageY;
         this.§_-A2i§ = this.§_-c2Y§;
         this.§_-u3§ = this.§_-91u§;
         this.§_-020§ = true;
         this.§_-u2B§ = false;
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-l23§,true,0,true);
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-E1B§,true,0,true);
         this.§_-w1t§();
      }
      
      private function §_-Kg§(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = !this.§_-f1J§(param1.stageX,param1.stageY) && (this.§_-R7§(param1.stageX,param1.stageY) || this.§_-L1p§(param1.target as DisplayObject));
         if(_loc2_ == this.§_-Xu§)
         {
            return;
         }
         this.§_-Xu§ = _loc2_;
         this.§_-w1t§();
      }
      
      private function §_-R7§(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Point = this.globalToLocal(new Point(param1,param2));
         return _loc3_.x >= 0 && _loc3_.y >= 0 && _loc3_.x < this.§_-ro§ && _loc3_.y < this.§_-S1h§;
      }
      
      private function §_-f1J§(param1:Number, param2:Number) : Boolean
      {
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:DisplayObject = null;
         var _loc3_:DisplayObject = this;
         while(Boolean(_loc3_) && Boolean(_loc3_.parent))
         {
            _loc4_ = _loc3_.parent;
            _loc5_ = _loc4_.getChildIndex(_loc3_);
            _loc6_ = int(_loc4_.numChildren - 1);
            while(_loc6_ > _loc5_)
            {
               _loc7_ = _loc4_.getChildAt(_loc6_);
               if(_loc7_.visible)
               {
                  if(_loc7_.hitTestPoint(param1,param2,true))
                  {
                     return true;
                  }
               }
               _loc6_--;
            }
            _loc3_ = _loc4_;
         }
         return false;
      }
      
      private function §_-l23§(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.§_-41b§();
            return;
         }
         var _loc2_:Number = param1.stageX - this.§_-5J§;
         var _loc3_:Number = param1.stageY - this.§_-og§;
         if(Math.abs(_loc2_) > §_-Ym§ || Math.abs(_loc3_) > §_-Ym§)
         {
            this.§_-u2B§ = true;
         }
         var _loc4_:int = this.§_-b1d§() ? int(this.§_-A2i§ - _loc2_) : this.§_-c2Y§;
         var _loc5_:int = this.§_-X1n§() ? int(this.§_-u3§ - _loc3_) : this.§_-91u§;
         this.§_-d2M§(_loc4_,_loc5_);
      }
      
      private function §_-E1B§(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = this.§_-u2B§ || this.§_-c2Y§ != this.§_-A2i§ || this.§_-91u§ != this.§_-u3§;
         this.§_-41b§();
         if(_loc2_)
         {
            param1.stopImmediatePropagation();
            param1.preventDefault();
            if(this.stage)
            {
               this.stage.addEventListener(MouseEvent.CLICK,this.§_-S2o§,true,0,true);
            }
         }
      }
      
      private function §_-S2o§(param1:MouseEvent) : void
      {
         this.§_-n21§();
         if(this.§_-R7§(param1.stageX,param1.stageY) && !this.§_-f1J§(param1.stageX,param1.stageY))
         {
            param1.stopImmediatePropagation();
            param1.preventDefault();
         }
      }
      
      private function §_-n21§() : void
      {
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.CLICK,this.§_-S2o§,true);
         }
      }
      
      private function §_-41b§() : void
      {
         if(!this.§_-020§)
         {
            return;
         }
         this.§_-020§ = false;
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-l23§,true);
            this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-E1B§,true);
         }
         this.§_-w1t§();
      }
      
      private function §_-31g§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         if(!this.§_-X1n§())
         {
            return;
         }
         var _loc2_:Number = this.§_-51Q§.globalToLocal(new Point(param1.stageX,param1.stageY)).y;
         this.§_-Ps§(_loc2_ - this.§_-73N§() * 0.5);
      }
      
      private function §_-s1U§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         if(!this.§_-X1n§())
         {
            return;
         }
         var _loc2_:Stage = this.§_-51Q§.stage;
         if(!_loc2_)
         {
            return;
         }
         this.§_-32x§ = this.§_-51Q§.globalToLocal(new Point(param1.stageX,param1.stageY)).y - this.§_-s2R§();
         this.§_-31k§ = true;
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-F1d§,true,0,true);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.§_-xj§,true,0,true);
         this.§_-w1t§();
      }
      
      private function §_-F1d§(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.§_-VH§();
            return;
         }
         var _loc2_:Number = this.§_-51Q§.globalToLocal(new Point(param1.stageX,param1.stageY)).y;
         this.§_-Ps§(_loc2_ - this.§_-32x§);
      }
      
      private function §_-xj§(param1:MouseEvent) : void
      {
         this.§_-VH§();
      }
      
      private function §_-Ps§(param1:Number) : void
      {
         var _loc2_:int = this.§_-lv§() - this.§_-73N§();
         if(_loc2_ <= 0)
         {
            return;
         }
         param1 = Math.max(0,Math.min(param1,_loc2_));
         this.§_-d2M§(this.§_-c2Y§,int(param1 / _loc2_ * this.§_-83D§()));
      }
      
      private function §_-VH§() : void
      {
         if(!this.§_-31k§)
         {
            return;
         }
         this.§_-31k§ = false;
         if(Boolean(this.§_-51Q§) && Boolean(this.§_-51Q§.stage))
         {
            this.§_-51Q§.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-F1d§,true);
            this.§_-51Q§.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-xj§,true);
         }
         this.§_-w1t§();
      }
      
      private function §_-C6§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         if(!this.§_-b1d§())
         {
            return;
         }
         var _loc2_:Number = this.§_-83k§.globalToLocal(new Point(param1.stageX,param1.stageY)).x;
         this.§_-02v§(_loc2_ - this.§_-w1V§() * 0.5);
      }
      
      private function §_-tG§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         if(!this.§_-b1d§())
         {
            return;
         }
         var _loc2_:Stage = this.§_-83k§.stage;
         if(!_loc2_)
         {
            return;
         }
         this.§_-a0§ = this.§_-83k§.globalToLocal(new Point(param1.stageX,param1.stageY)).x - this.§_-A1f§();
         this.§_-w2d§ = true;
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-jW§,true,0,true);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.§_-91f§,true,0,true);
         this.§_-w1t§();
      }
      
      private function §_-jW§(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.§_-WY§();
            return;
         }
         var _loc2_:Number = this.§_-83k§.globalToLocal(new Point(param1.stageX,param1.stageY)).x;
         this.§_-02v§(_loc2_ - this.§_-a0§);
      }
      
      private function §_-91f§(param1:MouseEvent) : void
      {
         this.§_-WY§();
      }
      
      private function §_-02v§(param1:Number) : void
      {
         var _loc2_:int = this.§_-Nw§() - this.§_-w1V§();
         if(_loc2_ <= 0)
         {
            return;
         }
         param1 = Math.max(0,Math.min(param1,_loc2_));
         this.§_-d2M§(int(param1 / _loc2_ * this.§_-O1x§()),this.§_-91u§);
      }
      
      private function §_-WY§() : void
      {
         if(!this.§_-w2d§)
         {
            return;
         }
         this.§_-w2d§ = false;
         if(Boolean(this.§_-83k§) && Boolean(this.§_-83k§.stage))
         {
            this.§_-83k§.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-jW§,true);
            this.§_-83k§.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-91f§,true);
         }
         this.§_-w1t§();
      }
   }
}

