package §_-vK§
{
   public class §_-rf§ extends §_-q4§
   {
      
      private static const §_-Q10§:Object = {
         "free":[5,4,3],
         "paid":[2,1,1]
      };
      
      private var §_-YN§:Number;
      
      public function §_-rf§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-8R§;
         this.§_-YN§ = this.§_-Nu§();
      }
      
      override protected function §_-Nu§() : Number
      {
         var _loc1_:Number = Number(§_-Q10§["free"][0]);
         if(this.§_-e1P§ != 0)
         {
            _loc1_ = Math.min(§_-Q10§["free"][this.§_-e1P§ - 1],_loc1_);
         }
         if(this.§_-d1K§ != 0)
         {
            _loc1_ = Math.min(§_-Q10§["paid"][this.§_-e1P§ - 1],_loc1_);
         }
         return _loc1_;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero)
         {
            return;
         }
         this.hero.§_-j§.push(this.§_-YN§);
         if(this.§_-41W§)
         {
            ++this.hero.§_-WX§;
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         var _loc1_:int = this.hero.§_-j§.indexOf(this.§_-YN§);
         if(_loc1_ != -1)
         {
            this.hero.§_-j§.splice(_loc1_,1);
         }
         if(this.§_-41W§)
         {
            --this.hero.§_-WX§;
         }
      }
   }
}

