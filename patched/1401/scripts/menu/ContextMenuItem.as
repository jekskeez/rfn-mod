package menu
{
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-x1Z§;
   
   public class ContextMenuItem extends Sprite
   {
      
      private static const §_-kI§:int = 22;
      
      private static const §_-5g§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,11,6570780);
      
      private static const §_-V1J§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,11,6648452);
      
      private var §_-s1m§:Sprite;
      
      private var §_-Uv§:Sprite;
      
      private var button:SimpleButton;
      
      private var field:§_-22V§;
      
      private var §_-B31§:Sprite;
      
      private var §_-zi§:Sprite;
      
      private var §_-c1w§:Boolean = true;
      
      public function ContextMenuItem(param1:String, param2:int, param3:Sprite = null, param4:Sprite = null)
      {
         super();
         this.init(param1,param2,param3,param4);
      }
      
      private static function §_-3w§(param1:uint, param2:int) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(param1);
         _loc3_.graphics.drawRect(0,0,param2,§_-kI§);
         _loc3_.graphics.endFill();
         _loc3_.graphics.lineStyle(1,15784633);
         _loc3_.graphics.moveTo(0,0);
         _loc3_.graphics.lineTo(param2,0);
         return _loc3_;
      }
      
      public function set active(param1:Boolean) : void
      {
         if(this.§_-c1w§ == param1)
         {
            return;
         }
         this.§_-c1w§ = param1;
         this.mouseEnabled = param1;
         this.mouseChildren = param1;
         if(this.§_-zi§)
         {
            this.§_-zi§.visible = !param1;
         }
         if(this.§_-B31§)
         {
            this.§_-B31§.visible = param1;
         }
         if(param1)
         {
            this.button.filters = [];
            this.field.setTextFormat(§_-5g§);
         }
         else
         {
            this.button.filters = §_-x1Z§.§_-c2G§;
            this.field.setTextFormat(§_-V1J§);
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
         this.§_-s1m§ = §_-3w§(16250092,param2);
         this.§_-Uv§ = §_-3w§(16776179,param2);
         this.button = new SimpleButton();
         this.button.upState = this.§_-s1m§;
         this.button.overState = this.§_-Uv§;
         this.button.downState = this.§_-Uv§;
         this.button.hitTestState = this.§_-s1m§;
         this.button.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         addChild(this.button);
         this.field = new §_-22V§(param1,23,3,§_-5g§);
         this.field.mouseEnabled = false;
         addChild(this.field);
         if(param3)
         {
            this.§_-B31§ = param3;
            this.§_-B31§.x = 5;
            this.§_-B31§.y = 4;
            this.§_-B31§.mouseChildren = false;
            this.§_-B31§.mouseEnabled = false;
            addChild(this.§_-B31§);
         }
         if(param4)
         {
            this.§_-zi§ = param4;
            this.§_-zi§.x = 5;
            this.§_-zi§.y = 4;
            this.§_-zi§.mouseChildren = false;
            this.§_-zi§.mouseEnabled = false;
            this.§_-zi§.visible = false;
            addChild(this.§_-zi§);
         }
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         if(!this.§_-c1w§)
         {
            return;
         }
         dispatchEvent(new §_-Yo§(this));
      }
   }
}

