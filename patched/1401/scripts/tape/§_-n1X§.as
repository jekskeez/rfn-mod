package tape
{
   import §_-k1c§.§_-9f§;
   import §_-r2Y§.§_-33e§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class §_-n1X§ extends §_-K2k§
   {
      
      public static const §_-K12§:int = 0;
      
      protected var §_-L2v§:Boolean = false;
      
      protected var §_-Nh§:MovieClip = null;
      
      protected var §_-4A§:int;
      
      protected var _type:int = 0;
      
      public function §_-n1X§(param1:int, param2:int = 0)
      {
         super();
         this.§_-4A§ = param1;
         this._type = param2;
         this.buttonMode = true;
         this.init();
      }
      
      override public function listen(param1:Function) : void
      {
      }
      
      override public function forget(param1:Function) : void
      {
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get selected() : Boolean
      {
         return this.§_-L2v§;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.§_-L2v§ = param1;
         this.§_-Nh§.visible = this.§_-L2v§;
      }
      
      protected function init() : void
      {
         var _loc2_:Class = null;
         var _loc3_:DisplayObject = null;
         switch(this.type)
         {
            case §_-K12§:
               _loc2_ = §_-9f§.§_-a2O§(this.id);
               _loc3_ = new _loc2_();
               _loc3_.x = _loc3_.y = 2;
               addChild(_loc3_);
         }
         var _loc1_:ImageNewsButtonFrame = new ImageNewsButtonFrame();
         _loc1_.mouseEnabled = false;
         addChild(_loc1_);
         this.§_-Nh§ = new ImageNewsButtonSelected();
         this.§_-Nh§.visible = false;
         this.§_-Nh§.mouseEnabled = false;
         this.§_-Nh§.mouseChildren = false;
         addChild(this.§_-Nh§);
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-33y§);
      }
      
      protected function §_-33y§(param1:MouseEvent) : void
      {
         dispatchEvent(new §_-33e§(this,§_-33e§.STICKED));
      }
   }
}

