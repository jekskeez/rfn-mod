package §_-z2V§
{
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-c2C§.§_-x2y§;
   import flash.text.TextFormat;
   import tape.§_-2n§;
   import tape.§_-S1M§;
   import tape.§_-h2f§;
   
   public class §_-22q§ extends §_-S1M§
   {
      
      public var §_-L2q§:WardrobeOutfitSkinsPanel = null;
      
      public var character:int = 0;
      
      private var §_-j2u§:§_-i5§ = null;
      
      public function §_-22q§()
      {
         super(8,1,10,0,10,0,95,100);
      }
      
      override public function setData(param1:§_-h2f§) : void
      {
         var _loc2_:§_-2n§ = null;
         super.setData(param1);
         this.§_-j2u§.visible = param1.objects.length == 0;
         if(this.§_-02G§ != null)
         {
            for each(_loc2_ in param1.objects)
            {
               if(_loc2_.id == this.§_-02G§.id)
               {
                  select(_loc2_);
                  return;
               }
            }
         }
         select(param1.objects.length != 0 ? param1.objects[0] as §_-2n§ : null);
      }
      
      public function §_-u1p§() : void
      {
         if(this.data.objects.length != 0)
         {
            select(this.data.objects[0] as §_-2n§);
         }
      }
      
      public function §_-t19§() : void
      {
         var _loc1_:int = §_-L1o§.§_-WM§(this.character);
         if(_loc1_ == -1)
         {
            this.§_-u1p§();
            return;
         }
         var _loc2_:int = §_-P2x§.§_-b2c§(_loc1_);
         var _loc3_:int = 0;
         while(_loc3_ < this.data.objects.length)
         {
            if((this.data.objects[_loc3_] as §_-B1H§).id == _loc2_)
            {
               select(this.data.objects[_loc3_] as §_-B1H§);
               this.offset = Math.max(0,Math.min(_loc3_,this.data.objects.length - this.§_-A1Z§));
               break;
            }
            _loc3_++;
         }
      }
      
      override protected function init() : void
      {
         this.§_-j2u§ = new §_-i5§(gls("У тебя ещё нет ни одного костюма"),0,50,new TextFormat(§_-i5§.§_-p1s§,16,16777215));
         this.§_-j2u§.x = (§_-Zy§.§_-21V§ - this.§_-j2u§.textWidth) * 0.5;
         addChild(this.§_-j2u§);
      }
      
      override protected function §_-j2y§() : void
      {
         super.§_-j2y§();
         this.§_-T1X§.x = -this.§_-T1X§.width - 1;
         this.§_-T1X§.y = this.§_-y2b§ + (this.§_-w1q§ * (this.§_-g6§ + this.offsetY) - this.offsetY) * 0.5 - this.§_-T1X§.height * 0.5;
         this.buttonNext.x = this.§_-230§ * 2 + this.§_-A1Z§ * (this.§_-13r§ + this.offsetX) - this.offsetX + 1;
         this.buttonNext.y = this.§_-y2b§ + (this.§_-w1q§ * (this.§_-g6§ + this.offsetY) - this.offsetY) * 0.5 - this.buttonNext.height * 0.5;
      }
      
      override protected function §_-11q§(param1:§_-2n§) : void
      {
         if(this.§_-L2q§ == null)
         {
            return;
         }
         var _loc2_:§_-x2y§ = §_-x2y§.instance;
         if(_loc2_ != null && this.character != _loc2_.§_-Z1H§)
         {
            return;
         }
         this.§_-L2q§.§_-Pe§(param1);
      }
   }
}

