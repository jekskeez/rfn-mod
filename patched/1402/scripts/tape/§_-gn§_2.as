package tape
{
   import §_-a11§.§_-h2m§;
   import §_-bN§.§_-RY§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class §_-gn§ extends §_-QN§
   {
      
      public static const §_-FM§:int = 0;
      
      protected var §_-n2P§:Boolean = false;
      
      protected var §_-Oh§:MovieClip = null;
      
      protected var §_-n2x§:int;
      
      protected var _type:int = 0;
      
      public function §_-gn§(param1:int, param2:int = 0)
      {
         super();
         this.§_-n2x§ = param1;
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
         return this.§_-n2x§;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get selected() : Boolean
      {
         return this.§_-n2P§;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.§_-n2P§ = param1;
         this.§_-Oh§.visible = this.§_-n2P§;
      }
      
      protected function init() : void
      {
         var _loc2_:Class = null;
         var _loc3_:DisplayObject = null;
         switch(this.type)
         {
            case §_-FM§:
               _loc2_ = §_-RY§.§_-c2p§(this.id);
               _loc3_ = new _loc2_();
               _loc3_.x = _loc3_.y = 2;
               addChild(_loc3_);
         }
         var _loc1_:ImageNewsButtonFrame = new ImageNewsButtonFrame();
         _loc1_.mouseEnabled = false;
         addChild(_loc1_);
         this.§_-Oh§ = new ImageNewsButtonSelected();
         this.§_-Oh§.visible = false;
         this.§_-Oh§.mouseEnabled = false;
         this.§_-Oh§.mouseChildren = false;
         addChild(this.§_-Oh§);
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-p10§);
      }
      
      protected function §_-p10§(param1:MouseEvent) : void
      {
         dispatchEvent(new §_-h2m§(this,§_-h2m§.STICKED));
      }
   }
}

