package §_-q24§
{
   import §_-Qy§.§_-RT§;
   import §_-X1k§.§_-EJ§;
   import events.GameEvent;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import views.§_-xl§;
   
   public class §_-510§ extends §_-F2c§
   {
      
      protected var §_-q1l§:§_-RT§ = null;
      
      public function §_-510§(param1:int)
      {
         super(param1);
         §_-EJ§.addEventListener(GameEvent.SMILES_CHANGED,this.§_-w1T§);
      }
      
      override protected function get backWidth() : int
      {
         return 110;
      }
      
      override protected function get backHeight() : int
      {
         return 115;
      }
      
      override protected function §_-5N§() : void
      {
         this.§_-Oh§ = new ElementPackageBackSelectedGreen();
         this.§_-Oh§.width = this.backWidth;
         this.§_-Oh§.height = this.backHeight;
         this.§_-Oh§.visible = false;
         addChild(this.§_-Oh§);
         this.back = new ElementPackageBack();
         this.back.width = this.backWidth;
         this.back.height = this.backHeight;
         addChild(this.back);
         this.§_-Q1w§ = new §_-i5§(this.title,5,10,this.titleFormat);
         this.§_-Q1w§.width = this.backWidth - 10;
         this.§_-Q1w§.wordWrap = true;
         this.§_-Q1w§.selectable = false;
         addChild(this.§_-Q1w§);
         this.§_-Q1w§.y -= 7;
         this.image = new (this.icon as Class)();
         this.image.scaleX = this.image.scaleY = Math.min(this.image.width / 95,this.image.height / 95);
         this.image.x = int((this.backWidth - this.image.width) * 0.5);
         this.image.y = int((this.backHeight - this.image.height) * 0.5) + 5;
         addChild(this.image);
         this.§_-q1l§ = new §_-RT§(§_-RT§.§_-ZS§);
         this.§_-q1l§.x = 12;
         this.§_-q1l§.y = 100;
         this.§_-q1l§.scaleX = this.§_-q1l§.scaleY = 0.8;
         addChild(this.§_-q1l§);
         this.§_-w1T§();
      }
      
      override protected function get titleFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-c10§,12,6697728,true,null,null,null,null,"center");
      }
      
      override protected function get title() : String
      {
         return §_-EJ§.§_-aO§[this.id].name;
      }
      
      private function §_-w1T§(param1:GameEvent = null) : void
      {
         this.§_-q1l§.visible = §_-xl§.§_-83p§(this.id);
      }
      
      private function get icon() : Class
      {
         return getDefinitionByName(§_-EJ§.§_-aO§[this.id].icon) as Class;
      }
   }
}

