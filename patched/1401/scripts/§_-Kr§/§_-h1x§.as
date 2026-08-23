package §_-Kr§
{
   import fl.data.DataProvider;
   import flash.display.CapsStyle;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.JointStyle;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-h1x§ extends Sprite
   {
      
      private static const §_-z1O§:int = 22;
      
      private static const §_-R20§:int = 1;
      
      private static const §_-k1f§:int = 161;
      
      private static const §_-C2A§:int = 3;
      
      private static const §_-I27§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,6175017,true);
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,6175017);
      
      private var _width:int;
      
      private var §_-32§:Array = [];
      
      private var §_-1r§:int = 0;
      
      private var §_-63U§:SimpleButton;
      
      private var §_-211§:§_-22V§;
      
      private var §_-z1e§:Sprite;
      
      private var §_-I1N§:Sprite;
      
      private var §_-q2z§:Sprite;
      
      private var §_-L2h§:Sprite;
      
      private var §_-R1y§:Sprite;
      
      private var arrow:Sprite;
      
      private var items:Array = [];
      
      private var §_-02L§:Boolean = false;
      
      private var §_-M1N§:ScrollPane;
      
      public function §_-h1x§(param1:int = 160)
      {
         super();
         this._width = param1;
         this.init();
         addEventListener(Event.ADDED_TO_STAGE,this.§_-wm§);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-h2j§);
      }
      
      public function set §_-gx§(param1:*) : void
      {
         var _loc2_:int = 0;
         if(param1 is Array)
         {
            this.§_-32§ = (param1 as Array).concat();
         }
         else if(param1 is DataProvider)
         {
            this.§_-32§ = [];
            _loc2_ = 0;
            while(_loc2_ < (param1 as DataProvider).length)
            {
               this.§_-32§.push((param1 as DataProvider).getItemAt(_loc2_));
               _loc2_++;
            }
         }
         else
         {
            this.§_-32§ = [];
         }
         this.§_-1r§ = this.§_-32§.length > 0 ? 0 : -1;
         this.§_-A1s§();
         this.§_-Q7§();
      }
      
      public function get §_-Uf§() : int
      {
         return this.§_-1r§;
      }
      
      public function set §_-Uf§(param1:int) : void
      {
         if(param1 < 0 || param1 >= this.§_-32§.length)
         {
            return;
         }
         this.§_-1r§ = param1;
         this.§_-Q7§();
      }
      
      public function get §_-l1§() : Object
      {
         if(this.§_-1r§ < 0 || this.§_-1r§ >= this.§_-32§.length)
         {
            return null;
         }
         return this.§_-32§[this.§_-1r§];
      }
      
      public function addItem(param1:Object) : void
      {
         this.§_-32§.push(param1);
         if(this.§_-1r§ < 0)
         {
            this.§_-1r§ = 0;
         }
         this.§_-A1s§();
         this.§_-Q7§();
      }
      
      public function removeAll() : void
      {
         this.§_-32§ = [];
         this.§_-1r§ = -1;
         this.§_-A1s§();
         this.§_-Q7§();
      }
      
      public function getItemAt(param1:int) : Object
      {
         if(param1 >= 0 && param1 < this.§_-32§.length)
         {
            return this.§_-32§[param1];
         }
         return null;
      }
      
      public function get length() : int
      {
         return this.§_-32§.length;
      }
      
      public function getItemIndex(param1:Object) : int
      {
         if(param1 == null)
         {
            return -1;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-32§.length)
         {
            if(this.§_-32§[_loc2_]["value"] == param1["value"])
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function §_-p1A§(param1:Object) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-32§.length)
         {
            if(this.§_-32§[_loc2_]["value"] == param1)
            {
               this.§_-1r§ = _loc2_;
               this.§_-Q7§();
               return;
            }
            _loc2_++;
         }
      }
      
      public function get enabled() : Boolean
      {
         return this.mouseEnabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this.mouseEnabled = this.mouseChildren = param1;
         this.alpha = param1 ? 1 : 0.5;
      }
      
      public function dispose() : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.§_-wm§);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-h2j§);
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-q1k§);
         }
         if(this.§_-M1N§)
         {
            this.§_-M1N§.dispose();
            this.§_-M1N§ = null;
         }
      }
      
      private function init() : void
      {
         this.§_-z1e§ = this.§_-B3u§(16777215,false);
         this.§_-I1N§ = this.§_-B3u§(16775395,false);
         this.§_-q2z§ = this.§_-B3u§(16777215,true);
         this.§_-L2h§ = this.§_-B3u§(16775395,true);
         this.§_-63U§ = new SimpleButton();
         this.§_-Tj§();
         this.§_-63U§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-f2p§);
         addChild(this.§_-63U§);
         this.§_-211§ = new §_-22V§("",5,2,§_-I27§,this._width - 25);
         this.§_-211§.mouseEnabled = false;
         addChild(this.§_-211§);
         this.arrow = this.§_-Y1G§();
         this.arrow.x = this._width - 18;
         this.arrow.y = 9;
         addChild(this.arrow);
         this.§_-M1N§ = new ScrollPane();
         this.§_-M1N§.y = §_-z1O§;
         this.§_-M1N§.visible = false;
         this.§_-M1N§.setSize(this._width,§_-z1O§);
         this.§_-M1N§.verticalLineScrollSize = §_-z1O§ + §_-R20§;
         addChild(this.§_-M1N§);
         this.§_-R1y§ = new Sprite();
         this.§_-M1N§.source = this.§_-R1y§;
      }
      
      private function §_-wm§(param1:Event) : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-q1k§,false,0,true);
      }
      
      private function §_-h2j§(param1:Event) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-q1k§);
         if(this.§_-02L§)
         {
            this.§_-X2g§();
         }
      }
      
      private function §_-Tj§() : void
      {
         if(this.§_-02L§)
         {
            this.§_-63U§.upState = this.§_-q2z§;
            this.§_-63U§.overState = this.§_-L2h§;
            this.§_-63U§.downState = this.§_-L2h§;
            this.§_-63U§.hitTestState = this.§_-q2z§;
         }
         else
         {
            this.§_-63U§.upState = this.§_-z1e§;
            this.§_-63U§.overState = this.§_-I1N§;
            this.§_-63U§.downState = this.§_-I1N§;
            this.§_-63U§.hitTestState = this.§_-z1e§;
         }
      }
      
      private function §_-B3u§(param1:uint, param2:Boolean = false) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(param1);
         _loc3_.graphics.lineStyle(1,14996402,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
         if(param2)
         {
            this.§_-J2S§(_loc3_.graphics,0,0,this._width,§_-z1O§);
         }
         else
         {
            _loc3_.graphics.drawRoundRect(0,0,this._width,§_-z1O§,§_-C2A§ * 2,§_-C2A§ * 2);
         }
         _loc3_.graphics.endFill();
         return _loc3_;
      }
      
      private function §_-J2S§(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.moveTo(param2 + §_-C2A§,param3);
         param1.lineTo(param2 + param4 - §_-C2A§,param3);
         param1.curveTo(param2 + param4,param3,param2 + param4,param3 + §_-C2A§);
         param1.lineTo(param2 + param4,param3 + param5);
         param1.lineTo(param2,param3 + param5);
         param1.lineTo(param2,param3 + §_-C2A§);
         param1.curveTo(param2,param3,param2 + §_-C2A§,param3);
      }
      
      private function §_-23K§(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.moveTo(param2,param3);
         param1.lineTo(param2 + param4,param3);
         param1.lineTo(param2 + param4,param3 + param5 - §_-C2A§);
         param1.curveTo(param2 + param4,param3 + param5,param2 + param4 - §_-C2A§,param3 + param5);
         param1.lineTo(param2 + §_-C2A§,param3 + param5);
         param1.curveTo(param2,param3 + param5,param2,param3 + param5 - §_-C2A§);
         param1.lineTo(param2,param3);
      }
      
      private function §_-Y1G§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(6175017);
         _loc1_.graphics.moveTo(0,0);
         _loc1_.graphics.lineTo(6,6);
         _loc1_.graphics.lineTo(12,0);
         _loc1_.graphics.endFill();
         _loc1_.mouseEnabled = false;
         return _loc1_;
      }
      
      private function §_-a2A§(param1:int) : int
      {
         return param1 * (§_-z1O§ + §_-R20§);
      }
      
      private function §_-22g§() : int
      {
         return this.§_-32§.length * §_-z1O§ + Math.max(0,this.§_-32§.length - 1) * §_-R20§;
      }
      
      private function §_-A1s§() : void
      {
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:Sprite = null;
         while(this.§_-R1y§.numChildren > 0)
         {
            this.§_-R1y§.removeChildAt(0);
         }
         this.items = [];
         this.§_-M1N§.graphics.clear();
         if(this.§_-32§.length == 0)
         {
            this.§_-M1N§.setSize(this._width,§_-z1O§);
            this.§_-M1N§.update();
            return;
         }
         var _loc1_:int = this.§_-22g§();
         var _loc2_:int = Math.min(_loc1_,§_-k1f§);
         this.§_-M1N§.graphics.beginFill(16777215);
         this.§_-M1N§.graphics.lineStyle(1,14996402,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
         this.§_-23K§(this.§_-M1N§.graphics,0,0,this._width,_loc2_);
         this.§_-M1N§.graphics.endFill();
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-32§.length)
         {
            _loc4_ = this.§_-32§[_loc3_];
            _loc5_ = _loc4_["label"] !== undefined ? _loc4_["label"] : _loc4_["value"].toString();
            _loc6_ = this.§_-x1P§(_loc5_,_loc3_,this._width,_loc3_ < this.§_-32§.length - 1);
            _loc6_.y = this.§_-a2A§(_loc3_);
            this.§_-R1y§.addChild(_loc6_);
            this.items.push(_loc6_);
            _loc3_++;
         }
         this.§_-M1N§.setSize(this._width,_loc2_);
         this.§_-M1N§.update();
         this.§_-M1N§.verticalScrollPosition = 0;
      }
      
      private function §_-x1P§(param1:String, param2:int, param3:int, param4:Boolean) : Sprite
      {
         var _loc10_:Sprite = null;
         var _loc5_:Sprite = new Sprite();
         _loc5_.graphics.beginFill(16777215,0);
         _loc5_.graphics.drawRect(0,0,param3,§_-z1O§);
         _loc5_.graphics.endFill();
         var _loc6_:Sprite = new Sprite();
         _loc6_.graphics.beginFill(16775395);
         _loc6_.graphics.drawRect(0,0,param3,§_-z1O§);
         _loc6_.graphics.endFill();
         var _loc7_:SimpleButton = new SimpleButton();
         _loc7_.upState = _loc5_;
         _loc7_.overState = _loc6_;
         _loc7_.downState = _loc6_;
         _loc7_.hitTestState = _loc5_;
         var _loc8_:Sprite = new Sprite();
         _loc8_.addChild(_loc7_);
         var _loc9_:§_-22V§ = new §_-22V§(param1,5,2,§_-i2c§,param3 - 10);
         _loc9_.mouseEnabled = false;
         _loc8_.addChild(_loc9_);
         if(param4)
         {
            _loc10_ = new Sprite();
            _loc10_.graphics.lineStyle(§_-R20§,14996402,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
            _loc10_.graphics.moveTo(0,0);
            _loc10_.graphics.lineTo(param3,0);
            _loc10_.y = §_-z1O§;
            _loc10_.mouseEnabled = false;
            _loc8_.addChild(_loc10_);
         }
         _loc8_.name = param2.toString();
         _loc7_.addEventListener(MouseEvent.CLICK,this.§_-Z1l§);
         return _loc8_;
      }
      
      private function §_-f2p§(param1:MouseEvent) : void
      {
         param1.preventDefault();
         param1.stopPropagation();
         this.§_-X2g§();
      }
      
      private function §_-Z1l§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         var _loc2_:int = int((param1.currentTarget as SimpleButton).parent.name);
         this.§_-1r§ = _loc2_;
         this.§_-Q7§();
         this.§_-X2g§();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function §_-q1k§(param1:MouseEvent) : void
      {
         if(!this.stage || !this.§_-02L§)
         {
            return;
         }
         if(!this.§_-M1N§.hitTestPoint(param1.stageX,param1.stageY) && !hitTestPoint(param1.stageX,param1.stageY))
         {
            this.§_-X2g§();
         }
      }
      
      private function §_-E15§() : void
      {
         var _loc1_:DisplayObjectContainer = this.parent as DisplayObjectContainer;
         if(_loc1_)
         {
            _loc1_.setChildIndex(this,_loc1_.numChildren - 1);
         }
         while(Boolean(_loc1_) && Boolean(_loc1_.parent))
         {
            _loc1_.parent.setChildIndex(_loc1_,_loc1_.parent.numChildren - 1);
            _loc1_ = _loc1_.parent as DisplayObjectContainer;
         }
      }
      
      private function §_-X2g§() : void
      {
         this.§_-02L§ = !this.§_-02L§;
         this.§_-M1N§.visible = this.§_-02L§;
         this.§_-Tj§();
         this.arrow.scaleY = this.§_-02L§ ? -1 : 1;
         this.arrow.y = this.§_-02L§ ? 14 : 8;
         if(!this.§_-02L§)
         {
            return;
         }
         this.§_-E15§();
         if(this.§_-32§.length == 0)
         {
            return;
         }
         var _loc1_:int = this.§_-22g§();
         var _loc2_:int = Math.min(_loc1_,§_-k1f§);
         var _loc3_:int = Math.max(0,_loc1_ - _loc2_);
         var _loc4_:int = this.§_-a2A§(this.§_-1r§);
         this.§_-M1N§.verticalScrollPosition = Math.min(Math.max(0,_loc4_ - _loc2_ / 2 + §_-z1O§ / 2),_loc3_);
      }
      
      private function §_-Q7§() : void
      {
         var _loc1_:Object = this.§_-l1§;
         this.§_-211§.text = _loc1_ ? (_loc1_["label"] !== undefined ? _loc1_["label"] : _loc1_["value"].toString()) : "";
      }
   }
}

