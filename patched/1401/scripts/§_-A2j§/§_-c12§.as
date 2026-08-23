package §_-A2j§
{
   import §_-I10§.§_-01k§;
   import §_-d10§.§_-s2E§;
   import events.GameEvent;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import views.§_-l1b§;
   
   public class §_-c12§ extends §_-q2§
   {
      
      protected var §_-21J§:§_-s2E§ = null;
      
      public function §_-c12§(param1:int)
      {
         super(param1);
         §_-01k§.addEventListener(GameEvent.SMILES_CHANGED,this.§_-Hp§);
      }
      
      override protected function get backWidth() : int
      {
         return 110;
      }
      
      override protected function get backHeight() : int
      {
         return 115;
      }
      
      override protected function §_-Cr§() : void
      {
         this.§_-Nh§ = new ElementPackageBackSelectedGreen();
         this.§_-Nh§.width = this.backWidth;
         this.§_-Nh§.height = this.backHeight;
         this.§_-Nh§.visible = false;
         addChild(this.§_-Nh§);
         this.back = new ElementPackageBack();
         this.back.width = this.backWidth;
         this.back.height = this.backHeight;
         addChild(this.back);
         this.§_-T1j§ = new §_-22V§(this.title,5,10,this.titleFormat);
         this.§_-T1j§.width = this.backWidth - 10;
         this.§_-T1j§.wordWrap = true;
         this.§_-T1j§.selectable = false;
         addChild(this.§_-T1j§);
         this.§_-T1j§.y -= 7;
         this.image = new (this.icon as Class)();
         this.image.scaleX = this.image.scaleY = Math.min(this.image.width / 95,this.image.height / 95);
         this.image.x = int((this.backWidth - this.image.width) * 0.5);
         this.image.y = int((this.backHeight - this.image.height) * 0.5) + 5;
         addChild(this.image);
         this.§_-21J§ = new §_-s2E§(§_-s2E§.§_-jI§);
         this.§_-21J§.x = 12;
         this.§_-21J§.y = 100;
         this.§_-21J§.scaleX = this.§_-21J§.scaleY = 0.8;
         addChild(this.§_-21J§);
         this.§_-Hp§();
      }
      
      override protected function get titleFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-F2z§,12,6697728,true,null,null,null,null,"center");
      }
      
      override protected function get title() : String
      {
         return §_-01k§.§_-p2R§[this.id].name;
      }
      
      private function §_-Hp§(param1:GameEvent = null) : void
      {
         this.§_-21J§.visible = §_-l1b§.§_-pq§(this.id);
      }
      
      private function get icon() : Class
      {
         return getDefinitionByName(§_-01k§.§_-p2R§[this.id].icon) as Class;
      }
   }
}

