package views
{
   import §_-X1k§.§_-XW§;
   import com.api.Player;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-73s§ extends Sprite
   {
      
      private var §_-Mt§:§_-i5§;
      
      private var photo:§_-V2O§;
      
      public function §_-73s§(param1:DisplayObject)
      {
         super();
         this.init(param1);
      }
      
      public function §_-yC§(param1:Player) : void
      {
         this.§_-Mt§.text = §_-XW§.§_-Wh§(param1["exp"]);
         this.§_-Mt§.x = 57 - int(this.§_-Mt§.textWidth * 0.5);
         this.photo.§_-yC§(param1);
      }
      
      private function init(param1:DisplayObject) : void
      {
         this.photo = new §_-V2O§(70,false);
         this.photo.x = 5;
         this.photo.y = 15;
         addChild(this.photo);
         addChild(param1);
         this.§_-Mt§ = new §_-i5§("",60,60,new TextFormat(§_-i5§.§_-p1s§,14,16777215));
         addChild(this.§_-Mt§);
      }
   }
}

