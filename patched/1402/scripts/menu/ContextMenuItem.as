package menu
{
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-y1l§;
   
   public class ContextMenuItem extends Sprite
   {
      
      private static const §_-i2u§:int = 22;
      
      private static const §_-Iw§:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,6570780);
      
      private static const §_-n2f§:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,6648452);
      
      private var §_-H21§:Sprite;
      
      private var §_-01n§:Sprite;
      
      private var button:SimpleButton;
      
      private var field:§_-i5§;
      
      private var §_-k1F§:Sprite;
      
      private var §_-k2h§:Sprite;
      
      private var §_-8x§:Boolean = true;
      
      public function ContextMenuItem(param1:String, param2:int, param3:Sprite = null, param4:Sprite = null)
      {
         super();
         this.init(param1,param2,param3,param4);
      }
      
      private static function §_-V19§(param1:uint, param2:int) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(param1);
         _loc3_.graphics.drawRect(0,0,param2,§_-i2u§);
         _loc3_.graphics.endFill();
         _loc3_.graphics.lineStyle(1,15784633);
         _loc3_.graphics.moveTo(0,0);
         _loc3_.graphics.lineTo(param2,0);
         return _loc3_;
      }
      
      public function set active(param1:Boolean) : void
      {
         if(this.§_-8x§ == param1)
         {
            return;
         }
         this.§_-8x§ = param1;
         this.mouseEnabled = param1;
         this.mouseChildren = param1;
         if(this.§_-k2h§)
         {
            this.§_-k2h§.visible = !param1;
         }
         if(this.§_-k1F§)
         {
            this.§_-k1F§.visible = param1;
         }
         if(param1)
         {
            this.button.filters = [];
            this.field.setTextFormat(§_-Iw§);
         }
         else
         {
            this.button.filters = §_-y1l§.§_-Tk§;
            this.field.setTextFormat(§_-n2f§);
         }
      }
      
      public function show() : void
      {
         this.visible = true;
      }
      
      public function hide() : void
      {
         this.visible = false;
      }
      
      private function init(param1:String, param2:int, param3:Sprite, param4:Sprite) : void
      {
         this.§_-H21§ = §_-V19§(16250092,param2);
         this.§_-01n§ = §_-V19§(16776179,param2);
         this.button = new SimpleButton();
         this.button.upState = this.§_-H21§;
         this.button.overState = this.§_-01n§;
         this.button.downState = this.§_-01n§;
         this.button.hitTestState = this.§_-H21§;
         this.button.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         addChild(this.button);
         this.field = new §_-i5§(param1,23,3,§_-Iw§);
         this.field.mouseEnabled = false;
         addChild(this.field);
         if(param3)
         {
            this.§_-k1F§ = param3;
            this.§_-k1F§.x = 5;
            this.§_-k1F§.y = 4;
            this.§_-k1F§.mouseChildren = false;
            this.§_-k1F§.mouseEnabled = false;
            addChild(this.§_-k1F§);
         }
         if(param4)
         {
            this.§_-k2h§ = param4;
            this.§_-k2h§.x = 5;
            this.§_-k2h§.y = 4;
            this.§_-k2h§.mouseChildren = false;
            this.§_-k2h§.mouseEnabled = false;
            this.§_-k2h§.visible = false;
            addChild(this.§_-k2h§);
         }
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         if(!this.§_-8x§)
         {
            return;
         }
         dispatchEvent(new §_-r13§(this));
      }
   }
}

